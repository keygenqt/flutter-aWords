import 'package:flutter/material.dart';
import 'package:website/app.dart';
import 'package:website/model.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';
import 'package:website/utils/locale.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({
    super.key,
    required this.color,
  });

  final Color? color;

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          Material(
            color: widget.color,
            child: InkWell(
              borderRadius: MediaQuery.of(context).size.width < 400 ? AppRadius.extraLarge : AppRadius.small,
              onTap: () => Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false),
              child: ClipRRect(
                child: Padding(
                  padding: MediaQuery.of(context).size.width < 400
                      ? const EdgeInsets.all(8)
                      : const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Image.asset(
                    MediaQuery.of(context).size.width < 400 ? 'images/icon_30.png' : 'images/logo_30.png',
                    height: 24,
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Container()),
          Wrap(
            children: [
              ClipOval(
                child: Material(
                  color: widget.color,
                  child: IconButton(
                    icon: const Icon(Icons.style),
                    color: Colors.blueGrey,
                    disabledColor: AppColors.secondary,
                    onPressed: ModalRoute.of(context)?.settings.name == AppRoutes.cards
                        ? null
                        : () => Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.cards,
                              ModalRoute.withName(AppRoutes.home),
                            ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: widget.color,
                  child: IconButton(
                    icon: const Icon(Icons.bar_chart),
                    color: Colors.blueGrey,
                    disabledColor: AppColors.secondary,
                    onPressed: ModalRoute.of(context)?.settings.name == AppRoutes.stats
                        ? null
                        : () => Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.stats,
                              ModalRoute.withName(AppRoutes.home),
                            ),
                  ),
                ),
              ),
              ClipOval(
                child: Material(
                  color: widget.color,
                  child: IconButton(
                    icon: const Icon(Icons.face_retouching_natural),
                    color: Colors.blueGrey,
                    disabledColor: AppColors.secondary,
                    onPressed: ModalRoute.of(context)?.settings.name == AppRoutes.friends
                        ? null
                        : () => Navigator.of(context).pushNamedAndRemoveUntil(
                              AppRoutes.friends,
                              ModalRoute.withName(AppRoutes.home),
                            ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7, bottom: 7, left: 8, right: 8),
                color: Colors.blueGrey[100],
                height: 25,
                width: 1,
              ),
              ClipOval(
                child: Material(
                  color: widget.color,
                  child: IconButton(
                    icon: const Icon(Icons.translate),
                    color: AppModel.of(context).locale == AppLocale.ru ? AppColors.secondary : Colors.blueGrey,
                    onPressed: () => AppModel.of(context).toggleLocale(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
