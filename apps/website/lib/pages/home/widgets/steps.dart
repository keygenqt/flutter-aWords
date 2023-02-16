import 'package:flutter/material.dart';
import 'package:website/theme/colors.dart';
import 'package:website/widgets/containers/page_item.dart';

class HomeStepsWidget extends StatelessWidget {
  const HomeStepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundLightSecondary,
      child: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 80, left: 30, right: 30),
        child: PageItemWidget(
          child: Column(
            children: [
              Text(
                'How it works',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppColors.primary,
                      // fontSize: MediaQuery.of(context).size.width < 1180 ? 40 : 60,
                    ),
              ),
              const SizedBox(height: 30),
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 500,
                ),
                child: Text(
                  'Follow a few steps to start using the app and succeed in learning a foreign language.',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Visibility(
                visible: MediaQuery.of(context).size.width > 800,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_1.png',
                        index: 1,
                        title: 'Registration',
                        text: 'In order to identify you in the system, you need to register. It\'s quite simple.',
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_2.png',
                        index: 2,
                        title: 'Cards',
                        text: 'You can use already created cards or you can create your own set of words to study.',
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_1.png',
                        index: 1,
                        title: 'Registration',
                        text: 'In order to identify you in the system, you need to register. It\'s quite simple.',
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      flex: 1,
                      child: _item(
                        context: context,
                        asset: 'images/home_steps_4.png',
                        index: 4,
                        title: 'Enjoy',
                        text: 'Learn foreign words wherever you want. Share results with friends.',
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                  visible: MediaQuery.of(context).size.width < 800 && MediaQuery.of(context).size.width > 400,
                  child: Wrap(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_1.png',
                              index: 1,
                              title: 'Registration',
                              text: 'In order to identify you in the system, you need to register. It\'s quite simple.',
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_2.png',
                              index: 2,
                              title: 'Cards',
                              text:
                                  'You can use already created cards or you can create your own set of words to study.',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_3.png',
                              index: 3,
                              title: 'Application',
                              text: 'Install the application. Apps for Android and Aurora OS are available.',
                            ),
                          ),
                          const SizedBox(width: 40),
                          Expanded(
                            flex: 1,
                            child: _item(
                              context: context,
                              asset: 'images/home_steps_4.png',
                              index: 4,
                              title: 'Enjoy',
                              text: 'Learn foreign words wherever you want. Share results with friends.',
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
              Visibility(
                visible: MediaQuery.of(context).size.width < 400,
                child: Column(
                  children: [
                    _item(
                      context: context,
                      asset: 'images/home_steps_1.png',
                      index: 1,
                      title: 'Registration',
                      text: 'In order to identify you in the system, you need to register. It\'s quite simple.',
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_2.png',
                      index: 2,
                      title: 'Cards',
                      text: 'You can use already created cards or you can create your own set of words to study.',
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_3.png',
                      index: 3,
                      title: 'Application',
                      text: 'Install the application. Apps for Android and Aurora OS are available.',
                    ),
                    _item(
                      context: context,
                      asset: 'images/home_steps_4.png',
                      index: 4,
                      title: 'Enjoy',
                      text: 'Learn foreign words wherever you want. Share results with friends.',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _item({
    required BuildContext context,
    required asset,
    required index,
    required title,
    required text,
  }) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Image.asset(
            asset,
            height: 120,
            width: 120,
          ),
          const SizedBox(height: 20),
          ClipOval(
            child: Container(
              color: AppColors.secondary,
              width: 30,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                '$index',
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
