import 'package:flutter/material.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select location'),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Locations list is empty :(\nCreate a new one with the plus button!',
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryAccent,
        elevation: 0.0,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
