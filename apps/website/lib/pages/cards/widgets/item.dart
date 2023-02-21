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
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 285,
      ),
      child: Card(
        child: Stack(
          children: [
            Column(
              children: [
                Image.network(
                  image,
                  fit: BoxFit.cover,
                  height: 140,
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
