import 'package:location/location.dart';

class LocationHelper{
   double? latitude;
   double? longitude;

  Future<void> getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;
    //Location için Servis çalışıyor mu ?
    _serviceEnabled = await location.serviceEnabled();
    if(!_serviceEnabled){
      _serviceEnabled = await location.requestService();
      if(!_serviceEnabled){
        return ;
      }
    }
    // Konum İzni kontrolü
    _permissionGranted = await location.hasPermission();
    if(_permissionGranted == PermissionStatus.denied){
      _permissionGranted = await location.requestPermission();

      if(_permissionGranted!= PermissionStatus.granted){
        return;
      }

    }
    // İzinler alındıysa
    _locationData = await location.getLocation();
    latitude = _locationData.latitude;
    longitude = _locationData.longitude;

  }
}