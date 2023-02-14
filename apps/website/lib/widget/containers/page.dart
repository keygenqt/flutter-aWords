import 'package:flutter/material.dart';
import 'package:website/extensions/keys_ext.dart';

class PageWidget extends StatefulWidget {
  const PageWidget({
    super.key,
    this.header,
    required this.body,
    this.footer,
    this.color = Colors.white,
    this.spacing = 0,
  });

  final Color color;
  final Widget? header;
  final Widget body;
  final Widget? footer;
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
        (widget.spacing *
            ((widget.header == null ? 0 : 1) +
                (widget.footer == null ? 0 : 1))) -
        (widget.header == null ? 0 : _header.getHeight() ?? _hH) -
        (widget.footer == null ? 0 : _footer.getHeight() ?? _fH);
    return height >= 0.0 ? height : 0;
  }

  @override
  Widget build(BuildContext context) {
    final list = <Widget>[];

    if (widget.header != null) {
      list.addAll([
        Container(
          key: _header,
          child: widget.header,
        ),
        SizedBox(height: widget.spacing),
      ]);
    }

    list.add(
      Container(
        constraints: BoxConstraints(minHeight: _getBodyHeight()),
        width: double.infinity,
        child: widget.body,
      ),
    );

    if (widget.footer != null) {
      list.addAll([
        SizedBox(height: widget.spacing),
        Container(
          key: _footer,
          child: widget.footer,
        )
      ]);
    }

    return Scaffold(
      backgroundColor: widget.color,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: list,
        ),
      ),
    );
  }
}
