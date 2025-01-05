import 'package:demo_task/viewmodels/country_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'country_detail_view.dart';

class CountryListView extends StatelessWidget {
  const CountryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountryViewModel()..fetchCountries(),
      child: Consumer<CountryViewModel>(
          builder: (context, countryViewModel, child) {
        return Scaffold(
          appBar: AppBar(
              title: (countryViewModel.isSearching)
                  ? const Text("Countries")
                  : TextFormField(
                      controller: countryViewModel.searchController,
                      onChanged: (value) {
                        countryViewModel.searchQuery(value);
                      },
                      decoration: const InputDecoration(
                          counterText: '',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.black),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)))),
                    ),
              actions: [
                PopupMenuButton(
                  onSelected: (value) {
                    countryViewModel.setSelectedPopUpItem(value);
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: "Ascending",
                      child: Text("Ascending"),
                    ),
                    const PopupMenuItem(
                      value: "Descending",
                      child: Text("Descending"),
                    ),
                  ],
                ),
                GestureDetector(
                    onTap: () => countryViewModel.toggleSearch(),
                    child: const Icon(Icons.search))
              ]),
          body: Consumer<CountryViewModel>(
            builder: (context, viewModel, child) {
              if (viewModel.isLoading && viewModel.countryList.isEmpty) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: viewModel.countryList.length +
                    (viewModel.isLoading ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == viewModel.countryList.length) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final country = viewModel.countryList[index];
                  return ListTile(
                    leading: Image.network(country.flagUrl, width: 50),
                    title: Text(country.name),
                    subtitle: Text(country.currency),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CountryDetailView(country: country),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        );
      }),
    );
  }
}
