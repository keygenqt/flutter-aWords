import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/model.dart';
import 'package:website/pages/sign_in/model.dart';
import 'package:website/widgets/buttons/button_form_loading.dart';

class SignInFormWidget extends StatefulWidget {
  const SignInFormWidget({super.key, required this.model});

  final SignInModel model;

  @override
  State<SignInFormWidget> createState() => _SignInFormWidgetState();
}

class _SignInFormWidgetState extends State<SignInFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
    // validate if change app model
    Future.delayed(Duration.zero, () {
      AppModel.of(context).addListener(() {
        Future.delayed(const Duration(milliseconds: 10), () {
          if (_emailKey.currentState?.hasError ?? false) {
            _emailKey.currentState!.validate();
          }
          if (_passwordKey.currentState?.hasError ?? false) {
            _passwordKey.currentState!.validate();
          }
        });
      });
    });
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
            decoration: InputDecoration(
              filled: true,
              hintText: AppLocalizations.of(context)!.signIn_field_email,
            ),
            onChanged: (_) => _emailKey.currentState!.validate(),
            validator: (value) => widget.model.validateEmail(context, value),
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _passwordKey,
            controller: password,
            obscureText: true,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.visiblePassword,
            decoration: InputDecoration(
              filled: true,
              hintText: AppLocalizations.of(context)!.signIn_field_passw,
            ),
            onChanged: (_) => _passwordKey.currentState!.validate(),
            validator: (value) => widget.model.validatePassword(context, value),
          ),
          const SizedBox(height: 30),
          ButtonFormLoadingWidget(
            loading: widget.model.loading,
            text: AppLocalizations.of(context)!.signIn_field_btn_submit,
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                // send
                final success = await widget.model.signIn(
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
