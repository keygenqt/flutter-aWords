import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/widgets/containers/page_item.dart';

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
    return PageItemWidget(
      child: Center(
        child: Lottie.asset(
          'lottie/404_not_found.json',
          height: 330,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
