import 'package:flutter/material.dart';

/// Alert form
class CardItemWidget extends StatelessWidget {
  const CardItemWidget({
    super.key,
    required this.image,
    required this.name,
    required this.desc,
  });

  final String image;
  final String name;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Card(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Wrap(
                  children: [
                    ClipOval(
                      child: Image.network(
                        image,
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    const SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          desc,
                          style: Theme
                              .of(context)
                              .textTheme
                              .bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {
                    debugPrint('Card tapped.');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
