import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/card/model.dart';
import 'package:website/widgets/containers/page_item.dart';

class CardPage extends StatefulWidget {
  const CardPage({
    super.key,
    required this.id,
  });

  final int id;

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final model = getIt<CardModel>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);
    final width = MediaQuery.of(context).size.width;

    return ScopedModel<CardModel>(
      model: model,
      child: ScopedModelDescendant<CardModel>(builder: (context, child, model) {
        return PageItemWidget(
          child: Center(
            child: Text(widget.id.toString()),
          ),
        );
      }),
    );
  }
}
