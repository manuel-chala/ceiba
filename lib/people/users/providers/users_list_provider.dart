import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/singletons.dart';
import '../../../core/utils/storage.dart';
import '../models/user.dart';
import '../services/users_service.dart';

class UsersListProvider extends StateNotifier<List<User>> {
  UsersListProvider([List<User> initialItems = const []]) : super(initialItems) {
    init();
  }

  Future<void> fetchUsers() async {
    try {
      state = await UsersService().list();
      singleton<Storage>().setString(
        Storage.USERS_KEY,
        "[${state.map((e) => jsonEncode(e.toJson())).toList().join(',')}]",
      );
    } catch (error) {
      state = [];
    }
  }

  void refresh() {
    state = [];
    fetchUsers();
  }

  init() {
    final savedData = singleton<Storage>().getString(Storage.USERS_KEY);
    if (savedData != null && savedData.isNotEmpty) {
      state = decodeSavedData(savedData);
    } else {
      fetchUsers();
    }
  }

  void filter(String val) {
    final savedData = singleton<Storage>().getString(Storage.USERS_KEY);
    if (savedData != null && savedData.isNotEmpty) {
      state = decodeSavedData(savedData).where((user) => user.name.toLowerCase().contains(val.toLowerCase())).toList();
    }
  }

  List<User> decodeSavedData(String savedData) {
    return jsonDecode(savedData).map<User>((item) => User.fromJson(item)).toList();
  }
}

final usersListProvider = StateNotifierProvider<UsersListProvider, List<User>>(
  (ref) => UsersListProvider(),
);
