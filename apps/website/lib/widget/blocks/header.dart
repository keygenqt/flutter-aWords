import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/utils/colors.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Text(
        'header: aWords',
        style: GoogleFonts.ubuntu(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
    );
  }
}
