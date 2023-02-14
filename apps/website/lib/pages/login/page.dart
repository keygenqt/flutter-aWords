import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/blocks/box_shadow.dart';
import '../../widget/containers/page_item.dart';

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
      child: BoxShadowWidget(
        child: Center(
          child: Column(
            children: [
              Text(
                'Login',
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
