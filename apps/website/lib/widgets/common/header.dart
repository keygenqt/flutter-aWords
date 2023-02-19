import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:website/model.dart';
import 'package:website/routes/routes.dart';
import 'package:website/theme/colors.dart';
import 'package:website/theme/radius.dart';

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
    final mediaQuery = MediaQuery.of(context);
    final modalRoute = ModalRoute.of(context);
    final navigator = Navigator.of(context);

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
              borderRadius: mediaQuery.size.width < 400 ? AppRadius.extraLarge : AppRadius.small,
              onTap: () => navigator.pushNamedAndRemoveUntil(AppRoutes.home, (Route<dynamic> route) => false),
              child: ClipRRect(
                child: Padding(
                  padding: mediaQuery.size.width < 400
                      ? const EdgeInsets.all(8)
                      : const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                  child: Image.asset(
                    mediaQuery.size.width < 400 ? 'images/icon_30.png' : 'images/logo_30.png',
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
                    onPressed: modalRoute?.settings.name == AppRoutes.cards
                        ? null
                        : () => navigator.pushNamedAndRemoveUntil(
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
                    onPressed: modalRoute?.settings.name == AppRoutes.stats
                        ? null
                        : () => navigator.pushNamedAndRemoveUntil(
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
                    onPressed: modalRoute?.settings.name == AppRoutes.friends
                        ? null
                        : () => navigator.pushNamedAndRemoveUntil(
                              AppRoutes.friends,
                              ModalRoute.withName(AppRoutes.home),
                            ),
                  ),
                ),
              ),
              _getLine(),
              ScopedModelDescendant<AppModel>(
                builder: (context, child, model) => model.isLogin
                    ? ClipOval(
                        child: Material(
                          color: widget.color,
                          child: IconButton(
                            tooltip: AppLocalizations.of(context)!.common_header_sign_out,
                            icon: const Icon(Icons.logout),
                            color: Colors.blueGrey,
                            disabledColor: AppColors.secondary,
                            onPressed: () {
                              // call logout
                              model.logout();
                              // open root page
                              navigator.pushReplacementNamed(AppRoutes.current);
                            },
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          color: widget.color,
                          child: IconButton(
                            tooltip: AppLocalizations.of(context)!.common_header_sign_in,
                            icon: const Icon(Icons.login),
                            color: Colors.blueGrey,
                            disabledColor: AppColors.secondary,
                            onPressed: modalRoute?.settings.name == AppRoutes.signIn
                                ? null
                                : () => navigator.pushNamedAndRemoveUntil(
                                      AppRoutes.signIn,
                                      ModalRoute.withName(AppRoutes.home),
                                    ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _getLine() {
    return Container(
      margin: const EdgeInsets.only(top: 7, bottom: 7, left: 8, right: 8),
      color: Colors.blueGrey[100],
      height: 25,
      width: 1,
    );
  }
}
