import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/friends/model.dart';
import 'package:website/widgets/containers/page_item.dart';

class FriendsPage extends StatefulWidget {
  const FriendsPage({
    super.key,
  });

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<FriendsModel>(
      model: getIt<FriendsModel>(),
      child: ScopedModelDescendant<FriendsModel>(builder: (context, child, model) {
        return PageItemWidget(
          child: Center(
            child: Column(
              children: [
                Lottie.asset(
                  'lottie/empty.json',
                  width: 260,
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
