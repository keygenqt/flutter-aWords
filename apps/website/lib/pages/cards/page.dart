import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/cards/model.dart';
import 'package:website/pages/cards/widgets/item.dart';
import 'package:website/widgets/containers/page_item.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({
    super.key,
  });

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  final model = getIt<CardsModel>();

  @override
  void initState() {
    super.initState();
    model.getList();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CardsModel>(
      model: model,
      child: ScopedModelDescendant<CardsModel>(builder: (context, child, model) {
        return PageItemWidget(
          child: Center(
            child: Wrap(
              spacing: 20,
              runSpacing: 20,
              children: model.loading || model.models == null
                  ? [
                      Lottie.asset(
                        'lottie/loading.json',
                        width: 180,
                        fit: BoxFit.contain,
                      )
                    ]
                  : (model.models!.isEmpty
                      ? [
                          Lottie.asset(
                            'lottie/empty.json',
                            width: 260,
                            fit: BoxFit.contain,
                          )
                        ]
                      : model.models!
                          .map((model) => CardItemWidget(
                                image: model.image,
                                name: model.name,
                                desc: model.desc,
                              ))
                          .toList()),
            ),
          ),
        );
      }),
    );
  }
}
