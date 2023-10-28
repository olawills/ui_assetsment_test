import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_assetsment_test/bloc/location/location_bloc.dart';
import 'package:ui_assetsment_test/bloc/map/map_bloc.dart';
import 'package:ui_assetsment_test/ui/page_one.dart';
import 'package:ui_assetsment_test/ui/page_two.dart';
import 'package:ui_assetsment_test/ui/splash_screen.dart';

import 'bloc/gps/gps_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(
          create: (context) =>
              MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)),
        ),
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: SplashScreen.route,
            routes: {
              SplashScreen.route: (context) => const SplashScreen(),
              PageOneUi.route: (context) => const PageOneUi(),
              PageTwoUi.route: (context) => const PageTwoUi(),
            },
          );
        });
  }
}
