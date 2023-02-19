import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/routes/routes.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/sign_in/model.dart';
import 'package:website/pages/sign_in/widgets/form.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/blocks/box_alert.dart';
import 'package:website/widgets/containers/page_item.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({
    super.key,
  });

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);

    return ScopedModel<SignInModel>(
      model: getIt<SignInModel>(),
      child: ScopedModelDescendant<SignInModel>(builder: (context, child, model) {
        return PageItemWidget(
          maxWidth: 400,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppRadius.large,
            ),
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                children: [
                  Text(
                    localizations.signIn_title,
                    style: theme.textTheme.titleMedium,
                  ),
                  BoxAlert(visible: model.errorCommon != null, text: model.errorCommon),
                  BoxAlert(
                    visible: model.success,
                    color: Colors.green,
                    text: localizations.signIn_successfully,
                  ),
                  const SizedBox(height: 20),
                  SignInFormWidget(model: model),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: model.loading ? null : () => navigator.pushReplacementNamed(AppRoutes.signUp),
                      child: Text(localizations.signIn_field_btn_signUp),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
