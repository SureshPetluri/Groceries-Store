import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../community_blog/community_blog_notifier.dart';
import '../community_blog/community_blog_state.dart';
import '../sign_in/sign_in_controller.dart';
import '../sign_in/sign_in_state.dart';


final signInProvider = StateNotifierProvider<SignInNotifier, SignInState>(
      (ref) => SignInNotifier(),
);
final communityBlogProvider = StateNotifierProvider<CommunityFeedNotifier, CommunityBlogModel>(
      (ref) => CommunityFeedNotifier(),
);