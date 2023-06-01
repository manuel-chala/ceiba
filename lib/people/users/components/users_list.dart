import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/users_list_provider.dart';
import 'users_list_tile.dart';

class UsersList extends BaseComponent {
  const UsersList({Key? key}) : super(key: key);

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final users = ref.watch(usersListProvider);

    if (users.isEmpty) {
      return const Center(
        child: Text('List is empty'),
      );
    }

    return ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => UsersListTile(users[index]),
    );
  }
}
