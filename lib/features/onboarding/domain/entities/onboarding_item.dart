import 'package:flutter/material.dart';

class OnboardingItem {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  const OnboardingItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OnboardingItem &&
        other.title == title &&
        other.description == description &&
        other.icon == icon &&
        other.color == color;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        icon.hashCode ^
        color.hashCode;
  }
} 