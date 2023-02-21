import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/sign_up/model.dart';
import 'package:website/pages/sign_up/widgets/form.dart';
import 'package:website/routes/routes.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/blocks/box_alert.dart';
import 'package:website/widgets/containers/page_item.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);

    return ScopedModel<SignUpModel>(
      model: getIt<SignUpModel>(),
      child: ScopedModelDescendant<SignUpModel>(builder: (context, child, model) {
        return PageItemWidget(
          maxWidth: 400,
          child: Card(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      localizations.signUp_title,
                      style: theme.textTheme.titleMedium,
                    ),
                    BoxAlert(visible: model.errorCommon != null, text: model.errorCommon),
                    BoxAlert(
                      visible: model.success,
                      color: Colors.green,
                      text: localizations.signUp_successfully,
                    ),
                    const SizedBox(height: 20),
                    SignUpFormWidget(model: model),
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: model.loading ? null : () => navigator.pushReplacementNamed(AppRoutes.signIn),
                        child: Text(localizations.signUp_field_btn_signIn),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
