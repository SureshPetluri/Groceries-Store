import 'package:flutter/material.dart';

class CommunityBlogModel {
  String? posts;
  String? selectedBgAsImage;
  List<String>? images;
  List<String>? comments;
  Color? color;

  CommunityBlogModel(
      {this.posts,
      this.images,
      this.color,
      this.selectedBgAsImage,
      this.comments});
}
