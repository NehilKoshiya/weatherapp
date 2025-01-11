import 'package:flutter/material.dart';
import 'package:interviewapp/routes/route_generator.dart';
import 'package:interviewapp/routes/route_path.dart';
import 'package:interviewapp/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'providers/weather_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => WeatherProvider()),
          ChangeNotifierProvider(
              create: (_) => WeatherProvider()..loadSearchHistory()),
        ],
        child: MaterialApp(
          title: 'Weather App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: RoutePath.splashRoute, 
          onGenerateRoute: RouteGenerator.generateRoute,
          home: SplashScreen(),
        ),
      );
    });
  }
}
