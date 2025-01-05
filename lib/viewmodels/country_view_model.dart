import 'package:demo_task/models/country_model.dart';
import 'package:demo_task/services/api_service.dart';
import 'package:flutter/cupertino.dart';

class CountryViewModel extends ChangeNotifier {
  ApiService apiService = ApiService();
  List<Country> countryList = [];
  List<Country> allCountryList = [];
  int page = 1;
  bool isLoading = false;

  TextEditingController searchController = TextEditingController();

  bool isSearching = false;

  Future<void> fetchCountries() async {
    if (isLoading) return;
    isLoading = true;
    notifyListeners();

    try {
      final countries = await apiService.fetchCountries(page, 10);
      allCountryList.addAll(countries);
      countryList.addAll(countries);
      page++;
    } catch (e) {
      debugPrint("Error fetching countries $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void setSelectedPopUpItem(String value) {
    if (value == "Ascending") {
      countryList.sort(
          (c1, c2) => c1.name.toLowerCase().compareTo(c2.name.toLowerCase()));
    } else if (value == "Descending") {
      countryList.sort(
          (c1, c2) => c2.name.toLowerCase().compareTo(c1.name.toLowerCase()));
    }
    notifyListeners();
  }

  void searchQuery(String value) {
    if (value.isEmpty) {
      allCountryList = countryList;
    } else {
      countryList = allCountryList
          .where((element) => element.name.toLowerCase().contains(value))
          .toList();
    }
    notifyListeners();
  }

  void toggleSearch() {
    isSearching = !isSearching;
    notifyListeners();
  }
}
