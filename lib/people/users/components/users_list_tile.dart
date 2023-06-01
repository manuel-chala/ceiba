import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/components/buttons.dart';
import '../../../navigation/app_router.gr.dart';
import '../models/user.dart';
import '../../../core/components/base_component.dart';

class UsersListTile extends BaseComponent {
  final User user;
  const UsersListTile(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(
            user.name,
            style: const TextStyle(color: Colors.green),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(children: [
                Icon(
                  Icons.phone,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(user.phone)
              ]),
              Row(children: [
                Icon(
                  Icons.mail,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Text(user.email)
              ]),
              AppButton(
                label: 'Ver publicaciones',
                type: AppButtonType.Text,
                onPressed: () {
                  AutoRouter.of(context).push(PostListScreenRoute(user: user));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
