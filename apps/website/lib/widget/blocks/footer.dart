import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/utils/colors.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({
    super.key,
  });

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Text(
        'footer: aWords',
        style: GoogleFonts.ubuntu(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
