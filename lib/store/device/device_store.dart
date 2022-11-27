import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'device_store.g.dart';

class DeviceStore = DeviceStoreBase with _$DeviceStore;

abstract class DeviceStoreBase with Store {
  static const Size _initialSize = Size(0, 0);
  Size size = _initialSize;

  void setSize(Size screenSize) {
    if (size == _initialSize) size = screenSize;
  }
}
