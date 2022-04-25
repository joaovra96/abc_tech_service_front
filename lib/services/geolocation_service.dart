
import 'package:geolocator/geolocator.dart';

abstract class GeolocationServiceInterface {
  Future<bool> _enabledService();
  Future<void> _requestPermission();
  bool isPermissionEnabled();
  Future<Position> getPosition();
  Future<bool> start();
}

class GeolocationService implements GeolocationServiceInterface {
    bool _serviceEnabled = false;
    late LocationPermission _permission = LocationPermission.denied;

  @override
  Future<bool> _enabledService() async {
    _serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    return Future.sync(() => true);
  }

  @override
  Future<void> _requestPermission() async {
    _permission = await Geolocator.checkPermission();
    if (_permission == LocationPermission.denied) {
      _permission = await Geolocator.requestPermission();
    }

    return Future.sync(() => null);
  }

  @override
  bool isPermissionEnabled() {
    return !(_permission == LocationPermission.denied || _permission == LocationPermission.deniedForever);
  }

  @override
  Future<Position> getPosition() async {
    if (!isPermissionEnabled()) {
      return Future.error('Permissão negada');
    }
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<bool> start() async {
    bool enabled = await _enabledService();

    if (enabled) {
      await _requestPermission();
      return Future.sync(() => true);
    }

    return Future.sync(() => false);
  }

}