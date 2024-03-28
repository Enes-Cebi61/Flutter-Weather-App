import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/screens/main_screen.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/utils/location.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/utils/weather.dart';
class loadingScreen extends StatefulWidget {
  const loadingScreen({super.key});

  @override
  State<loadingScreen> createState() => _loadingScreenState();
}

class _loadingScreenState extends State<loadingScreen> {
  late LocationHelper locationData;
  Future <void> getLocationData() async{
    locationData = LocationHelper();
    await locationData.getCurrentLocation();

    if(locationData.latitude == null || locationData.longitude ==null){
      print("Konum Bilgileri Alınamadı");
    }
    else{
      print("Latitude : " + locationData.latitude.toString());
      print("longitude : " + locationData.longitude.toString());
    }

  }

  void getweatherData() async{
    await getLocationData();

    WeatherData weatherData = WeatherData(locationData: locationData);
    await weatherData.getCurrentTemperature();

    if(weatherData.currentTemperature ==null || weatherData.currentCondition == null){
      print("API den sıcaklık veya durum bilgisi boş dönüyor");
    }
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context){
      return mainScreen(weatherData: weatherData,);
    }));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getweatherData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.blue]
          )
        ) ,
        child: Center(
          child: SpinKitChasingDots(
            color: Colors.white,
            size: 150.0,
            duration: Duration(milliseconds: 1200),

          ),
        ),
      )
    );
  }
}
