import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/containers/page_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          width: double.infinity,
          color: Colors.lightBlueAccent,
          child: Center(
            child: Text(
              'Block full width',
              style: GoogleFonts.ubuntu(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        PageItemWidget(
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
              child: Text(
                'PageItemWidget',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          width: double.infinity,
          color: Colors.lightGreen,
          child: Center(
            child: Text(
              'Block full width',
              style: GoogleFonts.ubuntu(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
        PageItemWidget(
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
              child: Text(
                'PageItemWidget',
                style: GoogleFonts.ubuntu(
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
          width: double.infinity,
          color: Colors.blueGrey,
          child: Center(
            child: Text(
              'Block full width',
              style: GoogleFonts.ubuntu(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
