import 'package:flutter/material.dart';
import 'package:my_app/data/restaurant_data.dart';
import 'package:my_app/ui/_core/app_theme.dart';
import 'package:my_app/ui/_core/bag_provider.dart';
import 'package:my_app/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RestaurantData restaurantData = RestaurantData();
  await restaurantData.getRestaurants();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) {
            return restaurantData;
          },
        ),
        ChangeNotifierProvider(create: (context) => BagProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.appTheme,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
