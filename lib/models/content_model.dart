import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Content {
  final String name;
  final String imageUrl;
  String? titleImageUrl;
  String? videoUrl;
  String? description;
  Color? color;

  Content({
    required this.name,
    required this.imageUrl,
    this.titleImageUrl,
    this.videoUrl,
    this.description,
    this.color,
  });
}
