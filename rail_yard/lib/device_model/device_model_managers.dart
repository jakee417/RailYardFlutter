import 'package:flutter/foundation.dart';
import 'package:rail_yard/device_model/device_model_manager.dart';

class DeviceManagers extends ChangeNotifier {
  List<DeviceManager> managers = [
    DeviceManager(),
  ];

  DeviceManager? getManager(int index) {
    return managers.elementAtOrNull(index);
  }

  void setManager(int index, DeviceManager Function(DeviceManager) fn) {
    var device = managers.elementAtOrNull(index);
    if (device != null) {
      managers[index] = device = fn(device);
      notifyListeners();
    }
  }

  void addManager(DeviceManager newDeviceManager) {
    managers.add(newDeviceManager);
    notifyListeners();
  }

  void deleteManager(int index) {
    managers.removeAt(index);
    notifyListeners();
  }
}
