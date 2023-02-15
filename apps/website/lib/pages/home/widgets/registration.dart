import 'package:flutter/material.dart';
import 'package:website/widgets/containers/page_item.dart';

class HomeRegistrationWidget extends StatelessWidget {
  const HomeRegistrationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 100, bottom: 100, left: 30, right: 30),
        child: PageItemWidget(
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: Text(
                'HomeRegistrationWidget',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
