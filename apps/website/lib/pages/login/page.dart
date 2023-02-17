import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/base/app_di.dart';
import 'package:website/pages/login/model.dart';
import 'package:website/theme/radius.dart';
import 'package:website/widgets/containers/page_item.dart';

import '../../theme/colors.dart';

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
          maxWidth: 500,
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
                    model.loading ? 'Loading...' : 'User ID: ${model.auth?.userId}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 20),
                  Material(
                    color: model.loading ? Colors.blueGrey : AppColors.secondary,
                    borderRadius: AppRadius.small,
                    child: InkWell(
                      borderRadius: AppRadius.small,
                      onTap: model.loading ? null : () {
                        model.login(email: 'best1@email.com', password: '12345678');
                      },
                      child: ClipRRect(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 14,
                          ),
                          child: Text(
                            'Login',
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
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
