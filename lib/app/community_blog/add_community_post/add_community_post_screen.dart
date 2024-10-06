import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:groceries_store/app/community_blog/community_blog_notifier.dart';
import 'package:groceries_store/app/widgets/app_text_field.dart';

import '../../providers/providers.dart';
import '../../widgets/image_picker.dart';
import '../../widgets/image_preview.dart';

class AddCommunityFeedScreen extends ConsumerWidget {
  const AddCommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var communityBlog = ref.watch(communityBlogProvider);
    var community = ref.read(communityBlogProvider.notifier);
    return Scaffold(
      body: Column(
        children: [
          AppTextField(
            controller: community.postController,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: communityBlog.images?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Stack(
                  children: [
                    ImagePreview(
                      imagePath: communityBlog.images![index],
                      height: 190,
                      width: 190,
                    ),
                    Positioned(
                      top: 15,
                      right: 12,
                      child: InkWell(
                        onTap: () {
                          community.removeImage(index);
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          ElevatedButton(
              onPressed: () {
                selectImage(context, community);
              },
              child: Text("selectImage")),
          ElevatedButton(
              onPressed: () {
                community.updatePost(context);
              },
              child: Text("Post"))
        ],
      ),
    );
  }

  Future<void> selectImage(
      BuildContext context, CommunityFeedNotifier community) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ), //this right here
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Select Image From !',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        String selectedImagePathProfile =
                            await ImagePickerClass.selectImageFromGallery();
                        Navigator.pop(context);
                        if (selectedImagePathProfile != '') {
                          // setState(() {
                          community.images?.add(selectedImagePathProfile);
                          // if (images!.isNotEmpty) {
                          //   currentColor = Colors.white;
                          // }
                          // });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No Image Selected !'),
                            ),
                          );
                        }
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gallery.png',
                                height: 60,
                                width: 60,
                              ),
                              const Text('Gallery'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    GestureDetector(
                      onTap: () async {
                        String selectedImagePathProfile =
                            await ImagePickerClass.selectImageFromCamera();
                        if (selectedImagePathProfile != '') {
                          Navigator.pop(context);
                          // setState(() {
                          community.images?.add(selectedImagePathProfile);
                          // if (images!.isNotEmpty) {
                          //   currentColor = Colors.white;
                          // }
                          // });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('No Image Captured !'),
                            ),
                          );
                        }
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/camera.png',
                                height: 60,
                                width: 60,
                              ),
                              const Text('Camera'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
