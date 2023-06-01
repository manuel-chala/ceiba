import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/screens/base_screen.dart';
import '../components/users_list.dart';
import '../providers/users_list_provider.dart';

class UsersListScreen extends BaseScreen {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Text("Prueba de ingreso"),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(hintText: 'Filtrar usuarios', icon: Icon(Icons.search)),
          onChanged: (val) {
            ref.read(usersListProvider.notifier).filter(val);
          },
        ),
        const Expanded(child: UsersList()),
      ],
    );
  }
}
