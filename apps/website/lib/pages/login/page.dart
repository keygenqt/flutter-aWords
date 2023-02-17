import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/login/model.dart';
import 'package:website/pages/login/widgets/form.dart';
import 'package:website/theme/radius.dart';
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
                    'Sign In',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 30),
                  Visibility(
                    visible: model.error['form'] != null,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: AppRadius.medium,
                      ),
                      child: Text(
                        '${model.error['form']}',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: model.success,
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: AppRadius.medium,
                      ),
                      child: Text(
                        'Authorization passed successfully!',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LoginFormWidget(model: model),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
