import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/cards/model.dart';
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
            child: Column(
              children: [
                Text(
                  model.loading ? 'Loading...' : 'List cards, count: ${model.models?.length}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
