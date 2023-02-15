import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/blocks/box_shadow.dart';
import 'package:website/widgets/containers/page_item.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({
    super.key,
  });

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return PageItemWidget(
      maxWidth: 500,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppRadius.large,
        ),
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            children: [
              Text(
                'Registration will be here',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
