import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_weather/presentation/pages/add_location_page/add_location_page_bloc/add_location_page_bloc.dart';
import 'package:simple_weather/presentation/pages/add_location_page/components/location_list_item.dart';

import '../../../assets/colors/app_colors.dart';
import '../../ui_kit/debounced_text_field.dart';

class AddLocationPage extends StatelessWidget {
  const AddLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddLocationPageBloc(),
      child: BlocConsumer<AddLocationPageBloc, AddLocationPageState>(
        listener: (context, state) {},
        builder: (context, state) {
          final bloc = context.read<AddLocationPageBloc>();
          return Scaffold(
            backgroundColor: AppColors.lightBackground,
            appBar: AppBar(
              title: const Text('Search location'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    DebouncedTextField(
                      onChanged: (value) {
                        bloc.add(SearchEntered(value: value));
                      },
                      debounceTime: const Duration(seconds: 1),
                      decoration:
                          const InputDecoration(labelText: 'Location name'),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    if (state.isConnectionError)
                      Column(
                        children: [
                          const Text(
                              'Ошибка соединения! Проверьте ваше подключение к интернету!'),
                          const SizedBox(
                            height: 16,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                bloc.add(PageRefreshed());
                              },
                              child: const Text('Повторить'))
                        ],
                      )
                    else if (state.isSearchLoading)
                      CircularProgressIndicator(
                        color: AppColors.primaryAccent,
                      )
                    else if (state.locations.isNotEmpty)
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.locations.length,
                          itemBuilder: (context, index) => LocationListItem(
                            location: state.locations[index],
                            onSaveClicked: (location) {
                              bloc.add(LocationAdded(location: location));
                            },
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
