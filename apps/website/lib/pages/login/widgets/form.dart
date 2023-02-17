import 'package:flutter/material.dart';
import 'package:validated/validated.dart' as validated;

import '../model.dart';

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
            decoration: const InputDecoration(
              filled: true,
              hintText: 'Email',
            ),
            onChanged: (value) {
              widget.model.clear('email');
              _emailKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter email';
              }
              if (!validated.isEmail(value)) {
                return 'Email is not match';
              }
              return widget.model.error['email'];
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            enabled: !widget.model.loading,
            key: _passwordKey,
            controller: password,
            obscureText: true,
            style: Theme.of(context).textTheme.bodyMedium,
            keyboardType: TextInputType.visiblePassword,
            decoration: const InputDecoration(
              filled: true,
              hintText: 'Password',
            ),
            onChanged: (value) {
              widget.model.clear('password');
              _passwordKey.currentState!.validate();
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter password';
              }
              return widget.model.error['password'];
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: widget.model.loading
                ? null
                : () async {
                    if (_formKey.currentState!.validate()) {
                      // (email: 'best1@email.com', password: '12345678')
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
            child: widget.model.loading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Submit',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white),
                  ),
          ),
          const SizedBox(height: 20),
          Container(
            alignment: Alignment.centerRight,
            child: OutlinedButton(
              onPressed: () {
                debugPrint('Registration');
              },
              child: const Text('Registration'),
            ),
          ),
        ],
      ),
    );
  }
}
