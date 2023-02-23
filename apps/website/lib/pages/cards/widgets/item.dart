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
    final width = MediaQuery.of(context).size.width;
    double itemWidth = 285.0;

    if (width < 1260) {
      itemWidth = (width - 30 * 2) / 3 - (20 - 20 / 3) - 1;
    }
    if (width < 800) {
      itemWidth = (width - 30 * 2) / 2 - (20 - 20 / 2) - 1;
    }
    if (width < 400) {
      itemWidth = width - 30 * 2;
    }

    return SizedBox(
      width: itemWidth,
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: 160,
                  width: double.infinity,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          desc,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
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
