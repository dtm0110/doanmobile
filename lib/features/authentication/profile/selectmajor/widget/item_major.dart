import 'package:flutter/material.dart';
import 'package:job_search/data/model/major.dart';

import '../../../../../generated/assets.dart';
import '../../../../../theme/themes.dart';

class ItemNetwork extends StatelessWidget {
  final Major network;
  final Function(Major) onTap;
  final bool isSelected;

  const ItemNetwork(this.onTap, this.isSelected, {super.key, required this.network});

  @override
  Widget build(BuildContext context) => InkWell(
      onTap: () {
        onTap.call(network);
      },
      child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(children: [
                Image.asset(
                  Assets.imagesIcCheck,
                width: 24.0,
                height: 24.0,
                color: (network.isSelected ?? false)
                    ? UIColors.primary
                    : UIColors.white,
              ),
              const SizedBox(width: 8.0),
              Image.asset(
                Assets.imagesIcLogo,
                width: 32.0,
                height: 32.0,
                color: UIColors.grayscale1,
              ),
              const SizedBox(width: 8.0),
              Text(network.name ?? "", style: ThemeTextStyle.body14),
            ]),
            // const Divider(height: 1, color: UIColors.grayscale1)
          ])));
}
