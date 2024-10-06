import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'community_blog_state.dart';

class CommunityFeedNotifier extends StateNotifier<CommunityBlogModel> {
  CommunityFeedNotifier() : super(CommunityBlogModel());
  List<CommunityBlogModel> communityPosts = [];
  List<String>? images = [];
  TextEditingController postController = TextEditingController();

  updatePost(BuildContext context) {
    state.images = images;
    state.posts = postController.text;
    Navigator.pop(context);
  }
  removeImage(int index){
    state.images?.remove(images![index]);
  }
}
