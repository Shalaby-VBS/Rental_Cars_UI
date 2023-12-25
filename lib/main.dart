import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'ui/screens/home_screen.dart';
import 'utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Rental Car',
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          home: const HomeScreen(),
        );
      },
    );
  }
}
