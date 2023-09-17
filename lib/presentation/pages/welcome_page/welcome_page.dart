import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../assets/colors/app_colors.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final girlImage = SvgPicture.asset('assets/splash_girl.svg');

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            girlImage,
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Get started!'),
            )
          ],
        ),
      ),
    );
  }
}
