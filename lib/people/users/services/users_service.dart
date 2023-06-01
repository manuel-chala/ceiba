import '../../../core/services/base_service.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../models/user.dart';

class UsersService extends BaseService {
  static const baseUrl = "/users";

  Future<List<User>> list({
    String url = baseUrl,
    Map<String, dynamic> params = const {},
  }) async {
    try {
      final response = await getHttp(url, params: params);

      List<User> results = response['results'].map<User>((item) => User.fromJson(item)).toList();

      return results;
    } catch (e, stackTrace) {
      singleton<Log>().error("Problem fetching $url", e, stackTrace);
      return [];
    }
  }
}
