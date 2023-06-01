import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/screens/base_screen.dart';
import '../../users/models/user.dart';
import '../components/post_list.dart';

class PostListScreen extends BaseScreen {
  final User user;
  const PostListScreen(this.user, {Key? key}) : super(key: key);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(user.name),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: const [],
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              const Text('Phone:'),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.phone,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              const Text('E-mail:'),
              const SizedBox(
                width: 10,
              ),
              Text(
                user.email,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: PostList(user.id),
        ),
      ],
    );
  }
}
