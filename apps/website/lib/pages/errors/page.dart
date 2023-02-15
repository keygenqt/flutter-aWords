import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:website/widgets/containers/page_item.dart';

import '../../theme/colors.dart';
import '../../theme/radius.dart';

class Error404Page extends StatefulWidget {
  const Error404Page({
    super.key,
  });

  @override
  State<Error404Page> createState() => _Error404PageState();
}

class _Error404PageState extends State<Error404Page> {
  @override
  Widget build(BuildContext context) {
    return PageItemWidget(
      child: Center(
        child: Column(
          children: [
            Lottie.asset(
              'lottie/404_not_found.json',
              height: 330,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 20),
            Text(
              'Looks like we can\'t find the page you\'re looking for.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            Material(
              color: AppColors.secondary,
              borderRadius: AppRadius.small,
              child: InkWell(
                borderRadius: AppRadius.small,
                onTap: () => {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                    '/',
                    (Route<dynamic> route) => false,
                  )
                },
                child: ClipRRect(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ),
                    child: Text(
                      'To Home',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
