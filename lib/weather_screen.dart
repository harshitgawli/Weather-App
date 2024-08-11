import 'dart:ui';
import 'package:flutter/material.dart';
import 'forecast_cards.dart';
import 'additional_info.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    String city = "DELHI";
    final result = await http.get(Uri.parse(
        'api.openweathermap.org/data/2.5/weather?q=$city&APPID=$openWeatherApiKey'));
    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App",
              style: TextStyle(fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                debugPrint("refresh");

              },
              icon: const Icon(Icons.refresh_outlined),
            )
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //main card
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: const Padding(
                        padding: EdgeInsets.all(16),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                "300.67K",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Icon(
                                Icons.cloud,
                                size: 64,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Rain",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Weather Forecast",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      HourlyForecastCard(
                        time: "09:00",
                        icon: Icons.sunny,
                        temperature: "300.19K",
                      ),
                      HourlyForecastCard(
                        time: "12:00",
                        icon: Icons.cloudy_snowing,
                        temperature: "256.25K",
                      ),
                      HourlyForecastCard(
                        time: "15:00",
                        icon: Icons.air,
                        temperature: "290.16K",
                      ),
                      HourlyForecastCard(
                        time: "18:00",
                        icon: Icons.cloud,
                        temperature: "254.89K",
                      ),
                      HourlyForecastCard(
                        time: "21:00",
                        icon: Icons.sunny,
                        temperature: "317.81K",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Additional Information",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OtherInfo(
                      icon: Icons.water_drop,
                      txt: "Humidity",
                      val: "85",
                    ),
                    OtherInfo(
                      icon: Icons.air_outlined,
                      txt: "Wind Speed",
                      val: "32 km/h",
                    ),
                    OtherInfo(
                      icon: Icons.beach_access,
                      val: "46 pa",
                      txt: "Pressure",
                    ),
                  ],
                ),
              ],
            )));
  }
}
