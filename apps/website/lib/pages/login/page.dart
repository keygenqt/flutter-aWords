import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:website/widgets/containers/page_item.dart';

import '../../theme/radius.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                'Authorization will be here',
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
