import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/login/model.dart';
import 'package:website/pages/login/widgets/form.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/blocks/box_alert.dart';
import 'package:website/widgets/containers/page_item.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginModel>(
      model: getIt<LoginModel>(),
      child: ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
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
                    AppLocalizations.of(context)!.login_title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 30),
                  BoxAlert(visible: model.errorCommon != null, text: model.errorCommon),
                  BoxAlert(
                    visible: model.success,
                    color: Colors.green,
                    text: AppLocalizations.of(context)!.login_successfully,
                  ),
                  const SizedBox(height: 20),
                  LoginFormWidget(model: model),
                  const SizedBox(height: 20),
                  Container(
                    alignment: Alignment.centerRight,
                    child: OutlinedButton(
                      onPressed: () => Navigator.of(context).pushNamed('/registration'),
                      child: Text(AppLocalizations.of(context)!.login_field_btn_reg),
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
