import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/home/model.dart';
import 'package:website/pages/home/widgets/applications.dart';
import 'package:website/pages/home/widgets/help.dart';
import 'package:website/pages/home/widgets/main.dart';
import 'package:website/pages/home/widgets/steps.dart';

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
    return ScopedModel<HomeModel>(
      model: getIt<HomeModel>(),
      child: ScopedModelDescendant<HomeModel>(builder: (context, child, model) {
        return Wrap(
          spacing: 20,
          runSpacing: 20,
          children: const [
            HomeMainWidget(),
            HomeStepsWidget(),
            HomeApplicationsWidget(),
            HomeHelpWidget(),
          ],
        );
      }),
    );
  }
}
