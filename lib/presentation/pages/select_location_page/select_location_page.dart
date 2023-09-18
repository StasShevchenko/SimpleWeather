import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/location_dto.dart';
import 'package:simple_weather/presentation/pages/add_location_page/add_location_page.dart';
import 'package:simple_weather/presentation/pages/select_location_page/components/location_list_item.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Select location'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('locationsBox').listenable(),
            builder: (context, box, widget) {
              if (box.isEmpty) {
                return const Center(
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
                );
              } else {
                return ListView.builder(
                  itemCount: box.values.length,
                  itemBuilder: (context, index) => LocationListItem(
                    location: (box.values.toList()[index] as LocationDto),
                    onItemClicked: (LocationDto location) {},
                  ),
                );
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryAccent,
        elevation: 0.0,
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddLocationPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
