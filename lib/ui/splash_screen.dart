import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_assetsment_test/bloc/gps/gps_bloc.dart';
import 'package:ui_assetsment_test/constants/theme/app_style.dart';
import 'package:ui_assetsment_test/ui/page_one.dart';

class SplashScreen extends StatefulWidget {
  static const String route = '/';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController =
      AnimationController(vsync: this, duration: const Duration(seconds: 3));

  _startDelay() {
    _animationController.forward().whenComplete(() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const PageOneUi(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    late GpsBloc locationBloc = BlocProvider.of<GpsBloc>(context);
    locationBloc.askGpsAccess();
    _startDelay();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final Animation<double> fadeInAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: fadeInAnimation,
          child: Text(
            'UI Test ',
            style: appStyle(25, Colors.red, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
