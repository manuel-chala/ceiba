import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post.dart';
import '../services/post_service.dart';

class PostListProvider extends StateNotifier<List<Post>> {
  final int userId;
  PostListProvider(this.userId, [List<Post> initialItems = const []]) : super(initialItems) {
    fetchPosts();
  }
  Future<void> fetchPosts() async {
    try {
      state = await PostService().list(userId: userId);
    } catch (error) {
      state = [];
    }
  }

  void refresh() {
    state = [];
    fetchPosts();
  }
}

final postListProvider = StateNotifierProvider.family<PostListProvider, List<Post>, int>(
  (ref, userId) => PostListProvider(userId),
);
