import 'package:etiya_assignment/core/shared/constant/app_ui_constant.dart';
import 'package:etiya_assignment/core/widgets/weather_item.dart';
import 'package:etiya_assignment/global.dart';
import 'package:etiya_assignment/model/weather/weather_model.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget_controller.dart';
import 'package:etiya_assignment/pages/homePage/search/search_widget_viewmodal.dart';
import 'package:etiya_assignment/pages/homePage/search/widgets/search_form_field.dart';
import 'package:etiya_assignment/pages/homePage/search/widgets/search_get_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    Key? key,
  }) : super(key: key);
  static final SearchWidgetController controller = SearchWidgetController();
  static const double bottomPadding =
      SearchWidgetViewModal.height + (SearchFormField.bottomPadding * 1.5);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        color: Theme.of(context).backgroundColor,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: bottomPadding),
              child: SingleChildScrollView(
                reverse: true,
                child: Observer(
                  builder: (_) {
                    final List<MapEntry<String, dynamic>> data =
                        searchStore.searchCities.entries.toList();
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      reverse: true,
                      padding: UiConstant.verticalPadding,
                      itemCount: data.length,
                      itemBuilder: (BuildContext context, int index) {
                        final Weather? weather = data[index].value;
                        final String city = data[index].key;

                        return weather != null
                            ? WeatherItem(weather: weather)
                            : SearchGetInfo(city: city);
                      },
                    );
                  },
                ),
              ),
            ),
            SearchFormField(controller: controller),
          ],
        ),
      ),
    );
  }
}
