import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/localization/text.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget_controller.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget_viewmodal.dart';
import 'package:flutter/material.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SearchWidgetController controller;
  static const double bottomPadding = 30;
  static final double leftPadding =
      (deviceStore.size.width - SearchWidgetViewModal.widht) / 2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottomPadding,
      left: leftPadding,
      child: Center(
        child: SizedBox(
          height: SearchWidgetViewModal.height,
          width: SearchWidgetViewModal.widht,
          child: Container(
            height: SearchWidgetViewModal.height,
            width: SearchWidgetViewModal.widht,
            decoration: BoxDecoration(
              borderRadius: SearchWidgetViewModal.borderRadius,
              color: Theme.of(context).primaryColor,
            ),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                foregroundColor: Theme.of(context).backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: SearchWidgetViewModal.borderRadius,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: controller.textEditingController,
                  decoration: const InputDecoration(hintText: AppText.search),
                  onChanged: (value) => searchService(value),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void searchService(String value) {
    if (value.isNotEmpty) {
      final Set<String> weatherCity = weatherStore.cities
          .where(
              (element) => element.toLowerCase().contains(value.toLowerCase()))
          .toSet();

      final Set<String>? localCity = citiesService.cities
          ?.where((element) =>
              !weatherCity.contains(element) &&
              element.toLowerCase().contains(value.toLowerCase()))
          .toSet();
      searchStore.clearSearchCities();
      for (var city in weatherCity) {
        searchStore.addSearchCities(city: city, hasWeather: true);
      }
      for (var city in localCity ?? {}) {
        searchStore.addSearchCities(city: city);
      }
    } else {
      searchStore.clearSearchCities();
    }
  }
}
