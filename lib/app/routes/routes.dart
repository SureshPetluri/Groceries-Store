import 'package:flutter/material.dart';
import 'package:groceries_store/app/community_blog/add_community_post/add_community_post_screen.dart';
import 'package:groceries_store/app/community_blog/community_blog_screen.dart';
import 'package:groceries_store/app/routes/routes_name.dart';
import 'package:groceries_store/app/sign_in/sign_in_screen.dart';

import '../forgot_password/forgot_password_screen.dart';
import '../sign_up/sign_up_screen.dart';

class Routes {
  static Route<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.logInScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignInScreen(),
        );
      case RoutesName.registerScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SignUpScreen(),
        );
      case RoutesName.forgotPassword:
        return MaterialPageRoute(
          builder: (BuildContext context) => const ForgotPassword(),
        );
      case RoutesName.feedScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => const CommunityFeedScreen(),
        );
      case RoutesName.verifyPasswordReset:
        return MaterialPageRoute(
          builder: (BuildContext context) => const AddCommunityFeedScreen(),
        );
      // case RoutesName.changePassword:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const ChangePassword(),
      //   );
      // case RoutesName.createPostScreen:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => const CreatePostScreen(),
      //   );
      // case RoutesName.updatePostScreen:
      //   final Map<String, dynamic> arguments =
      //       settings.arguments as Map<String, dynamic>;
      //   final PostModel postModel = arguments['postModel'] as PostModel;
      //   final int index = arguments['index'] as int;
      //
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => UpdatePostScreen(
      //       postModel: postModel,
      //       index: index,
      //     ),
      //   );

      // case RoutesName.comments:
      //   final Map<String, dynamic> arguments =
      //       settings.arguments as Map<String, dynamic>;
      //   final PostModel postModel = arguments['postModel'] as PostModel;
      //   final int index = arguments['index'] as int;
      //
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => Comments(
      //       postModel: postModel,
      //       index: index,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          builder: (_) {
            return const Scaffold(
              body: Center(
                child: Text('No route defined'),
              ),
            );
          },
        );
    }
  }
}
