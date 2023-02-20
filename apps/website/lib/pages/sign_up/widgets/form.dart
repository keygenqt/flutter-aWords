import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/base/app_di.dart';
import 'package:website/model.dart';
import 'package:website/pages/sign_up/model.dart';
import 'package:website/routes/routes.dart';
import 'package:website/widgets/buttons/button_form_loading.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key, required this.model});

  final SignUpModel model;

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final AppModel appModel = getIt<AppModel>();

  final _formKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final _fieldName = TextEditingController();
  final _fieldEmail = TextEditingController();
  final _fieldPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _fieldName.dispose();
    _fieldEmail.dispose();
    _fieldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    final navigator = Navigator.of(context);

    // validate for change localization
    if (_nameKey.currentState?.hasError ?? false) {
      _nameKey.currentState!.validate();
    }
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
            key: _nameKey,
            controller: _fieldName,
            style: theme.textTheme.bodyMedium,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              filled: true,
              hintText: localizations.signUp_field_name,
            ),
            onChanged: (_) {
              widget.model.clearError();
              _nameKey.currentState!.validate();
            },
            validator: (value) => widget.model.validateName(context, value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _emailKey,
            controller: _fieldEmail,
            style: theme.textTheme.bodyMedium,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: localizations.signUp_field_email,
            ),
            onChanged: (_) {
              widget.model.clearError();
              _emailKey.currentState!.validate();
            },
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
              hintText: localizations.signUp_field_passw,
            ),
            onChanged: (_) {
              widget.model.clearError();
              _passwordKey.currentState!.validate();
            },
            validator: (value) => widget.model.validatePassword(context, value),
          ),
          const SizedBox(height: 30),
          ButtonFormLoadingWidget(
            loading: widget.model.loading,
            text: localizations.signUp_field_btn_submit,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // send
                final success = await widget.model.signUp(
                  name: _nameKey.currentState!.value,
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
                  _nameKey.currentState!.validate();
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
