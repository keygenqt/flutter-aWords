import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/app.dart';
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
                    AppLocalizations.of(context)!.signIn_title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 30),
                  BoxAlert(visible: model.errorCommon != null, text: model.errorCommon),
                  BoxAlert(
                    visible: model.success,
                    color: Colors.green,
                    text: AppLocalizations.of(context)!.signIn_successfully,
                  ),
                  const SizedBox(height: 20),
                  SignInFormWidget(model: model),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: model.loading ? null : () => Navigator.of(context).pushNamed(AppRoutes.signUp),
                      child: Text(AppLocalizations.of(context)!.signIn_field_btn_signUp),
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
