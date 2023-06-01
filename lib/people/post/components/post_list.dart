import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/components/base_component.dart';
import '../providers/post_list_provider.dart';
import 'post_list_tile.dart';

class PostList extends BaseComponent {
  const PostList(this.userId, {Key? key}) : super(key: key);
  final int userId;

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postListProvider(userId));

    if (posts.isEmpty) {
      return const Center(
        child: Text('List is empty'),
      );
    }

    return ListView.builder(
      itemCount: posts.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => PostListTile(posts[index]),
    );
  }
}
