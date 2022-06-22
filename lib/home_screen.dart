import 'dart:convert';
import 'package:climate_app/get_weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var apikey = "0b88f8799d7099eb70cf6a417d42e8e5";
  var apiUrl =
      "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={0b88f8799d7099eb70cf6a417d42e8e5}";
  @override
  void initState() {
    super.initState();
    if (mounted) {
      getWeatherData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }

  void getWeatherData() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lat = position.latitude;
    var lon = position.longitude;
    var apikey = "0b88f8799d7099eb70cf6a417d42e8e5";
    var apiUrl =
        "api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={0b88f8799d7099eb70cf6a417d42e8e5}";
    var url = Uri.https("api.openweathermap.org", "/data/2.5/weather",
        {'lat': lat.toString(), 'lon': lon.toString(), 'appid': apikey});
    print(url);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => GetWeatherScreen(weatherData: data)));
    }
  }
}
