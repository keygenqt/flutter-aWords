import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:website/pages/errors/error404.dart';
import 'package:website/pages/home/home.dart';

import 'layouts/app_layout.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'aWords',
      theme: ThemeData(),
      initialRoute: '/',
      routes: {
        '/': (context) => const AppLayout(page: HomePage()),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (_) => const AppLayout(page: Error404Page()));
      },
    );
  }
}

// class _MyAppState extends State<MyApp> {
//
//   String? _selectedItem;
//   String? _selectedRoute;
//   bool show404 = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         title: 'aWords',
//         theme: ThemeData(),
//         home: Navigator(
//           pages: const [
//             MaterialPage(
//               key: ValueKey('ItemListScreen'),
//               child: AppLayout(page: HomePage()),
//             ),
//             MaterialPage(
//               key: ValueKey('Error404Page'),
//               child: AppLayout(page: Error404Page()),
//             ),
//           ],
//           onPopPage: (route, result) => route.didPop(result),
//         ),
//     );
//   }
// }
