import 'package:flutter/material.dart';

class TextHeaderAuth extends StatelessWidget {
  final String title;
  final String subTitle;
  const TextHeaderAuth({super.key, required this.title, this.subTitle = ""});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(height: 1.2)),
        const SizedBox(height: 10),
        if (subTitle.isNotEmpty)
          Text(subTitle,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.2)),
        if (subTitle.isNotEmpty) const SizedBox(height: 20),
      ],
    );
  }
}
