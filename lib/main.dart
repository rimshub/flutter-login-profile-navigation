// Main entry point for the app - define the routes and the initial route
// DTO: Data Transfer Object - a simple object that is used to transfer data between processes

import 'package:flutter/material.dart';
import 'package:madlab7/home_screen.dart';
import 'package:madlab7/login.dart';
import 'package:madlab7/splash_screen.dart';
import 'package:madlab7/top_tab.dart';
import 'package:madlab7/bottom_tab.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const SplashScreen(),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        // DTO: Data Transfer Object
        '/home': (context) => const HomeScreen(
              name: 'John Doe',
              imageName: 'images/profile.jpg',
              phone: '123-456-7890',
              email: 'john.doe@example.com',
              biometric: true,
              address: '123 Main Street, Anytown USA',
            ),
        '/login': (context) => const LoginScreen(),
        '/top_tab': (context) => const TopTab(),
        '/bottom_tab': (context) => const BottomTab(),
      },
    );
  }
}
