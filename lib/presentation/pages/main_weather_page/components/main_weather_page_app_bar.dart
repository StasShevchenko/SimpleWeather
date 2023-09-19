import 'package:flutter/material.dart';

import '../../../../assets/colors/app_colors.dart';
import 'dart:math' as math;


class MainWeatherPageAppBar extends StatelessWidget {
  final String title;

  const MainWeatherPageAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            Icons.location_on,
            size: 36,
            color: AppColors.primaryAccent,
          ),
          const SizedBox(
            width: 8,
          ),
          InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Text(
              title,
              style: TextStyle(color: AppColors.primaryAccent),
            ),
          ),
          const SizedBox(width: 8,),
          Transform.rotate(
            angle: 270 * math.pi / 180,
            child: const Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.grey,
              size: 20,
            ),
          ),
          const SizedBox(width: 8,)
        ],
      ),
    );
  }
}
