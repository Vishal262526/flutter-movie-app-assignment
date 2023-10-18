import 'package:flutter/material.dart';
import 'package:movie_app/utils/colors.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final VoidCallback onTap;
  final String title;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: kWhiteColor,
          textStyle: const TextStyle(fontSize: 20),
          padding: const EdgeInsets.all(20.0),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onTap,
        child: Row(
          children: [
            icon,
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
            ),
          ],
        ));
  }
}
