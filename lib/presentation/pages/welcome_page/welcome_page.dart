import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_weather/presentation/pages/select_location_page/select_location_page.dart';

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
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const SelectLocationPage()));
              },
              child: const Text('Get started!'),
            )
          ],
        ),
      ),
    );
  }
}
