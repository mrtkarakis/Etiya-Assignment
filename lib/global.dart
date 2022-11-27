library store.store;

import 'package:etiya_assignment/private/private_constant.dart';
import 'package:etiya_assignment/services/assets/assets_service.dart';
import 'package:etiya_assignment/services/cities/cities_service.dart';
import 'package:etiya_assignment/services/network/api_service.dart';
import 'package:etiya_assignment/store/device/device_store.dart';
import 'package:etiya_assignment/store/weather/weather_store.dart';

// Service
final ApiService apiService = ApiService.instance;
final AssetService assetService = AssetService.instance;
final CitiesService citiesService = CitiesService.instance;
final PrivateConstant privateConstant = PrivateConstant.instance;

// Store
final WeatherStore weatherStore = WeatherStore();
final DeviceStore deviceStore = DeviceStore();
