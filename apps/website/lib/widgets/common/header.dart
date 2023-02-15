import 'package:flutter/material.dart';
import 'package:website/widgets/buttons/button_image.dart';

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
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
      decoration: BoxDecoration(
        color: widget.color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Row(
        children: [
          ButtonImageWidget(
            color: widget.color,
            image: Image.asset('images/logo_30.png', height: 24),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                '/',
                (Route<dynamic> route) => false,
              );
            },
          ),
          Expanded(child: Container()),
          ClipOval(
            child: Material(
              color: widget.color,
              child: IconButton(
                icon: const Icon(Icons.login),
                tooltip: 'Sign In',
                onPressed: () => Navigator.of(context).pushNamed('/login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
