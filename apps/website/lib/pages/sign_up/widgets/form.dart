import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:website/pages/sign_up/model.dart';
import 'package:website/widgets/buttons/button_form_loading.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key, required this.model});

  final SignUpModel model;

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameKey = GlobalKey<FormFieldState>();
  final _emailKey = GlobalKey<FormFieldState>();
  final _passwordKey = GlobalKey<FormFieldState>();

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    name.dispose();
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
            key: _nameKey,
            controller: name,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              filled: true,
              hintText: AppLocalizations.of(context)!.signUp_field_name,
            ),
            onChanged: (_) => _nameKey.currentState!.validate(),
            validator: widget.model.validateName,
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _emailKey,
            controller: email,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              filled: true,
              hintText: AppLocalizations.of(context)!.signUp_field_email,
            ),
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
            decoration: InputDecoration(
              filled: true,
              hintText: AppLocalizations.of(context)!.signUp_field_passw,
            ),
            onChanged: (_) => _passwordKey.currentState!.validate(),
            validator: widget.model.validatePassword,
          ),
          const SizedBox(height: 30),
          ButtonFormLoadingWidget(
            loading: widget.model.loading,
            text: AppLocalizations.of(context)!.signUp_field_btn_submit,
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
                  name.text = '';
                  email.text = '';
                  password.text = '';
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
