import 'package:flutter/material.dart';
import 'package:website/pages/login/model.dart';
import 'package:website/widgets/buttons/button_form_loading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key, required this.model});

  final LoginModel model;

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: !widget.model.loading,
            key: _emailKey,
            controller: email,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(filled: true, hintText: AppLocalizations.of(context)!.login_field_email),
            onChanged: (_) => _emailKey.currentState!.validate(),
            validator: widget.model.validateEmail,
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _passwordKey,
            controller: password,
            obscureText: true,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(filled: true, hintText: AppLocalizations.of(context)!.login_field_passw),
            onChanged: (_) => _passwordKey.currentState!.validate(),
            validator: widget.model.validatePassword,
          ),
          const SizedBox(height: 30),
          ButtonFormLoadingWidget(
            loading: widget.model.loading,
            text: AppLocalizations.of(context)!.login_field_btn_submit,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // send
                final success = await widget.model.login(
                  email: _emailKey.currentState!.value,
                  password: _passwordKey.currentState!.value,
                );
                // check result
                if (success) {
                  email.text = '';
                  password.text = '';
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