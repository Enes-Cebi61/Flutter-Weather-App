import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:hava_durumu_projesi_mobil_uygulama/utils/weather.dart';

class mainScreen extends StatefulWidget {

  final WeatherData weatherData;

  mainScreen({required this.weatherData});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {
  late int temperature;
  late Icon weatherDisplayIcon;
  late AssetImage backgroundImage;
  late String  city;

  void updateDisplayInfo(WeatherData weatherData){
     setState(() {
       temperature =weatherData.currentTemperature.round();
       city = weatherData.city;
       WeatherDisplayData weatherDisplayData = weatherData.getWeatherDisplayData();
       backgroundImage = weatherDisplayData.weatherImage;
       weatherDisplayIcon = weatherDisplayData.weatherIcon;
     });
  }

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateDisplayInfo(widget.weatherData);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: backgroundImage,
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40,),
            Container(
              child:weatherDisplayIcon ,
            ),
            SizedBox(height: 15,),
            Center(
              child: Text('$temperature°',
              style: TextStyle(
                color: Colors.white,
                fontSize: 80.0,
                letterSpacing: -5

              ),),
            ),
            SizedBox(height: 15,),
            Center(
              child: Text('Istanbul',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    letterSpacing: -5

                ),),
            ),
          ],
        ),
      )
    );
  }
}
