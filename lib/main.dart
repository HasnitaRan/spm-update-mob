import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:spinemotion_app/pages/homepage/home_page.dart';
import 'package:spinemotion_app/pages/homepage/theme_provider.dart';
import 'package:spinemotion_app/pages/registerpage/provider/register_provider.dart';
import 'package:spinemotion_app/pages/terapipage/terapi_page.dart';
import 'package:spinemotion_app/pages/welcomepage/welcome_provider.dart';


void main() {runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<WelcomeProvider>(create: (context) => WelcomeProvider(),),
            ChangeNotifierProvider<ThemeProvider>(create: (context) => ThemeProvider() ),
            ChangeNotifierProvider<RegisterProvider>(create: (context) => RegisterProvider() )
          ],
            child: HomePage(),

        ),
      ),
    );
  }
}

