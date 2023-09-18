import 'package:flutter/material.dart';
import 'package:simple_weather/assets/colors/app_colors.dart';
import 'package:simple_weather/data/models/location_dto.dart';

class LocationListItem extends StatelessWidget {
  final LocationDto location;
  final Function(LocationDto location) onSaveClicked;

  const LocationListItem(
      {super.key, required this.location, required this.onSaveClicked});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Card(
        surfaceTintColor: Colors.white,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(location.name, textAlign: TextAlign.start,),
                    SizedBox(height: 8,),
                    Text(location.fullName)
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                onSaveClicked(location);
              },
              icon: Icon(
                Icons.save,
                color: AppColors.primaryAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
