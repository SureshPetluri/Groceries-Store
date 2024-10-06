import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';
import '../widgets/image_preview.dart';
import 'add_community_post/add_community_post_screen.dart';

class CommunityFeedScreen extends ConsumerWidget {
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var communityBlog = ref.watch(communityBlogProvider);
    var community = ref.read(communityBlogProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddCommunityFeedScreen()));
            },
            child: const Text("Add"),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: community.communityPosts.length,
          itemBuilder: (context, int listIndex) {
            return Column(
              children: [
                Text(community.communityPosts[listIndex].posts ?? ""),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount:
                      community.communityPosts[listIndex].images?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: ImagePreview(
                        imagePath: community
                                .communityPosts[listIndex].images?[index] ??
                            '',
                        height: 190,
                        width: 190,
                      ),
                    );
                  },
                )
              ],
            );
          }),
    );
  }
}
