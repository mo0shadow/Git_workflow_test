// lib/Core/Contants/app_text_styles.dart
import 'dart:ui';
import 'app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static const TextStyle figtree_30_bold_white = TextStyle(
    fontFamily: 'figtree',
    color: AppColors.wight,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
  static const TextStyle figtree_22_bold_white = TextStyle(
    fontFamily: 'figtree',
    color: AppColors.wight,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );
  static const TextStyle inter_20_600w_white = TextStyle(
    fontFamily: 'figtree',
    color: AppColors.wight,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle inter_24_600w_Black = TextStyle(
    fontFamily: 'inter',
    color: AppColors.dark_gray500,
    fontWeight: FontWeight.w600,
    fontSize: 20,
  );

  static const TextStyle figtree_16_400w_white = TextStyle(
    fontFamily: 'figtree',
    color: AppColors.wight,
    fontWeight: FontWeight.w400,
    fontSize: 17,
  );
}