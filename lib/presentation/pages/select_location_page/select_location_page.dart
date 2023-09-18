import 'package:flutter/material.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/presentation/pages/add_location_page/add_location_page.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select location'),
      ),
      body: const Center(
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
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddLocationPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
