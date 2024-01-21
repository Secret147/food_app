import 'package:flutter/material.dart';
import 'package:foodapp/pages/home/home_page.dart';
import 'package:foodapp/providers/test.dart';
import 'package:foodapp/router/router.dart';
import 'package:foodapp/utils/colors.dart';
import 'package:foodapp/utils/dimensions.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Dimensions dimension = Dimensions();
    dimension.init(context);
    return ChangeNotifierProvider(
      create: (_) => TestProvider(),
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
      ),
    );
  }
}
