import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/base/app_di.dart';
import 'package:website/build/build.config.dart';
import 'package:website/model.dart';
import 'package:website/pages/sign_in/model.dart';
import 'package:website/routes/routes.dart';
import 'package:website/widgets/buttons/button_form_loading.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key, required this.model});

  final SignInModel model;

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final BuildConfig config = getIt<BuildConfig>();
  final AppModel appModel = getIt<AppModel>();

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final _fieldEmail = TextEditingController();
  final _fieldPassword = TextEditingController();

  @override
  void initState() {
    if (config.isDebug) {
      _fieldEmail.text = 'best1@email.com';
      _fieldPassword.text = '12345678';
    }
    super.initState();
  }

  @override
  void dispose() {
    _fieldEmail.dispose();
    _fieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final navigator = Navigator.of(context);

    // validate for change localization
    if (_emailKey.currentState?.hasError ?? false) {
      _emailKey.currentState!.validate();
    }
    if (_passwordKey.currentState?.hasError ?? false) {
      _passwordKey.currentState!.validate();
    }
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: !widget.model.loading,
            key: _emailKey,
            controller: _fieldEmail,
            style: theme.textTheme.bodyMedium,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: localizations!.signIn_field_email,
            ),
            onChanged: (_) => _emailKey.currentState!.validate(),
            validator: (value) => widget.model.validateEmail(context, value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _passwordKey,
            controller: _fieldPassword,
            obscureText: true,
            style: theme.textTheme.bodyMedium,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              filled: true,
              hintText: localizations!.signIn_field_passw,
            ),
            onChanged: (_) => _passwordKey.currentState!.validate(),
            validator: (value) => widget.model.validatePassword(context, value),
          ),
          const SizedBox(height: 30),
          ButtonFormLoadingWidget(
            loading: widget.model.loading,
            text: localizations!.signIn_field_btn_submit,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // send
                final success = await widget.model.signIn(
                  email: _emailKey.currentState!.value,
                  password: _passwordKey.currentState!.value,
                );
                // check result
                if (success) {
                  Future.delayed(const Duration(seconds: 1), () {
                    // toggle app login
                    appModel.login();
                    // open root page
                    navigator.pushReplacementNamed(AppRoutes.redirect);
                  });
                } else {
                  _emailKey.currentState!.validate();
                  _passwordKey.currentState!.validate();
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
