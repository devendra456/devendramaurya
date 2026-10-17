import 'package:flutter/material.dart';

class ProjectModel {
  const ProjectModel({
    required this.title,
    required this.badge,
    required this.badgeColor,
    required this.categoryGroup,
    required this.description,
    this.imageAsset,
    this.logoAsset,
    this.fallbackIcon,
    required this.accentColor,
    required this.modalTitle,
    required this.modalCategory,
    required this.modalDescription,
    required this.technologies,
    this.playStoreUrl,
    this.appStoreUrl,
    this.companyName,
    this.companyUrl,
  });

  final String title;
  final String badge;
  final Color badgeColor;
  final String categoryGroup;
  final String description;
  final String? imageAsset;
  final String? logoAsset;
  final IconData? fallbackIcon;
  final Color accentColor;
  final String modalTitle;
  final String modalCategory;
  final String modalDescription;
  final List<String> technologies;
  final Uri? playStoreUrl;
  final Uri? appStoreUrl;
  final String? companyName;
  final Uri? companyUrl;
}
