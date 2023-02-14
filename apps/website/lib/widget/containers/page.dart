import 'package:flutter/material.dart';
import 'package:website/extensions/keys_ext.dart';

import '../../utils/colors.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({
    super.key,
    required this.header,
    required this.body,
    required this.footer,
    this.spacing = 0,
  });

  final Widget header;
  final Widget body;
  final Widget footer;
  final double spacing;

  @override
  State<PageWidget> createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  final _header = GlobalKey();
  final _footer = GlobalKey();

  double _hH = 0;
  double _fH = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {
          _hH = _header.getHeight() ?? 0;
          _fH = _footer.getHeight() ?? 0;
          Future.delayed(const Duration(milliseconds: 100), () {
            setState(() {
              _hH = _header.getHeight() ?? 0;
              _fH = _footer.getHeight() ?? 0;
            });
          });
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              _hH = _header.getHeight() ?? 0;
              _fH = _footer.getHeight() ?? 0;
            });
          });
        }));
  }

  double _getBodyHeight() {
    final height = MediaQuery.of(context).size.height -
        (widget.spacing * 2) -
        (_header.getHeight() ?? _hH) -
        (_footer.getHeight() ?? _fH);
    return height >= 0.0 ? height : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              key: _header,
              child: widget.header,
            ),
            SizedBox(height: widget.spacing),
            Container(
              constraints: BoxConstraints(minHeight: _getBodyHeight()),
              width: double.infinity,
              child: widget.body,
            ),
            SizedBox(height: widget.spacing),
            Container(
              key: _footer,
              child: widget.footer,
            )
          ],
        ),
      ),
    );
  }
}
