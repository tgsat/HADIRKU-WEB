import 'package:flutter/material.dart';

class AppColor {
  // Basic colors
  static const Color app = Color(0xFFEEF1FB);
  static const Color primary = Color(0xFFE46C24);
  static const Color secondary = Color(0xFF242424);
  static const Color accent = Color(0xFFB0C7FF);
  static const Color active = primary;

  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;

  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color lightGrey = Color(0xFFA4A6B3);
  static const Color dark = Color(0xFF272727);
  static const Color primarybackground = Color(0xFFF3F5FF);

  // Error & Validation Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color(0xFF1976D2);
  static const Color disable = Color(0xFFBBBBBB);

  // Neutral Shades Colors
  static const Color black = Color(0xFF232323);
  static const Color darkerGrey = Color(0xFF4F4F4F);
  static const Color darkGrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color softGrey = Color(0xFFF4F4F4);
  static const Color white = Color(0xFFFFFFFF);
  static const Color red = error;

  // Sosmed Colors
  static const Color facebook = Color(0xFF1877F2);
  static const Color twitter = Color(0xFF000000);
  static const Color instagram = Color(0xFFE1306C);
  static const Color linkedin = Color(0xFF0077B5);
  static const Color website = Color(0xFF25D366);

  /// App Gradient Colors
  /// [Facebook]
  static const Gradient facebookGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF1877F2),
      Color(0xFF1877F2),
    ],
  );

  /// [Twitter]
  static const Gradient twitterGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF000000),
      Color(0xFF000000),
    ],
  );

  /// [Instagram]
  static const Gradient instagramGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF405DE6),
      Color(0xFF5B51D8),
      Color(0xFF833AB4),
      Color(0xFFC13584),
      Color(0xFFE1306C),
      Color(0xFFFD1D1D),
      Color(0xFFF56040),
      Color(0xFFF77737),
      Color(0xFFFCAF45),
      Color(0xFFFFDC80),
    ],
  );

  /// [Linkedin]
  static const Gradient linkedinGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF0077B5),
      Color(0xFF0077B5),
    ],
  );

  /// [Website]
  static const Gradient websiteGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xFF075E54),
      Color(0xFF25D366),
    ],
  );
}
