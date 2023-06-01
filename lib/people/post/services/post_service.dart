import '../../../core/services/base_service.dart';
import '../../../core/utils/logging.dart';
import '../../../core/utils/singletons.dart';
import '../models/post.dart';

class PostService extends BaseService {
  Future<List<Post>> list({
    required int userId,
    Map<String, dynamic> params = const {},
  }) async {
    final url = '/posts?userid=$userId';
    try {
      final response = await getHttp(
        url,
        params: params,
      );

      List<Post> results = response['results'].map<Post>((item) => Post.fromJson(item)).toList();

      return results;
    } catch (e, stackTrace) {
      singleton<Log>().error("Problem fetching $url", e, stackTrace);
      return [];
    }
  }
}
