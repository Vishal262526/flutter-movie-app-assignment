import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';

void showSnackBar(BuildContext context, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        title,
        style: const TextStyle(
          color: kWhiteColor,
          fontWeight: FontWeight.w700,
        ),
      ),
      backgroundColor: kPrimaryLightColor,
    ),
  );
}
