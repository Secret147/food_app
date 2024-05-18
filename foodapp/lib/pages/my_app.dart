import 'dart:async';

import 'package:flutter/material.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/pages/startpage/start_page.dart';

import 'package:foodapp/providers/userProvider.dart';
import 'package:foodapp/router/router.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool _showSplash = true;

  @override
  void initState() {
    super.initState();
    // Delay showing splash for 2 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showSplash = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Dimensions dimension = Dimensions();
    dimension.init(context);

    return ChangeNotifierProvider(
      create: (_) => userProvider(),
      child: MaterialApp.router(
        routerConfig: RouterCustom.router,
        title: 'Food app',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Dimensions.darkmode
                  ? AppColors.brightColor
                  : AppColors.textColor,
            ).copyWith(
                background: Dimensions.darkmode
                    ? AppColors.darkColor
                    : AppColors.brightColor)),
        debugShowCheckedModeBanner: false,
        builder: (context, router) {
          return _showSplash ? const StartPage() : router!;
        },
      ),
    );
  }
}
