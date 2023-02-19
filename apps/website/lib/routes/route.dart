import 'package:flutter/material.dart';

/// Route app
class AppRoute {
  AppRoute({
    required this.route,
    required this.widget,
    this.user,
  });

  final bool? user;
  final String route;
  final Widget widget;
}
