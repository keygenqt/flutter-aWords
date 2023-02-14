import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/containers/page_item.dart';

class Error404Page extends StatefulWidget {
  const Error404Page({
    super.key,
  });

  @override
  State<Error404Page> createState() => _Error404PageState();
}

class _Error404PageState extends State<Error404Page> {
  @override
  Widget build(BuildContext context) {
    return         PageItemWidget(
      child: Container(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                '404',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                ),
              ),
              Text(
                'Page not found',
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
