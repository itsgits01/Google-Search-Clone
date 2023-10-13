import 'package:flutter/material.dart';
import 'package:google_flutter/colors.dart';
import 'package:google_flutter/responsive/mobile_screenlayout.dart';
import 'package:google_flutter/responsive/responsive_layout.dart';
import 'package:google_flutter/responsive/web_ScreenLayout.dart';
import 'package:google_flutter/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),

    );
  }
}
