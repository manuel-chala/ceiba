import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/post.dart';
import '../../../core/components/base_component.dart';

class PostListTile extends BaseComponent {
  final Post post;
  const PostListTile(this.post, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          title: Text(post.title),
          subtitle: Text(post.body),
        ),
      ),
    );
  }
}
