import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import the home screen we created earlier

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospital Finder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Primary and accent colors
        primaryColor: const Color(0xFF1A5D54),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A5D54),
          primary: const Color(0xFF1A5D54),
          secondary: Colors.amber,
          tertiary: Colors.blue,
          background: Colors.white,
        ),

        // Text theme
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A5D54),
          ),
          displayMedium: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A5D54),
          ),
          titleLarge: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),

        // Card theme
        cardTheme: CardTheme(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),

        // Input decoration theme
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
        ),

        // Elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1A5D54),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),

        // Outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFF1A5D54),
            side: const BorderSide(color: Color(0xFF1A5D54)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          ),
        ),

        // App bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1A5D54),
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        // Bottom navigation bar theme
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF1A5D54),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),

        // Divider theme
        dividerTheme: const DividerThemeData(
          color: Colors.grey,
          thickness: 0.5,
        ),

        // Font family
        fontFamily: 'SF Pro Display',

        // General settings
        scaffoldBackgroundColor: Colors.white,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HospitalFinderScreen(),
    );
  }
}
