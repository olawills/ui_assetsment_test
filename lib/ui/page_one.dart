import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ui_assetsment_test/bloc/gps/gps_bloc.dart';
import 'package:ui_assetsment_test/bloc/location/location_bloc.dart';
import 'package:ui_assetsment_test/bloc/map/map_bloc.dart';
import 'package:ui_assetsment_test/constants/extensions/spacer.dart';
import 'package:ui_assetsment_test/ui/page_two.dart';
import 'package:ui_assetsment_test/widgets/custom_btn.dart';
import 'package:ui_assetsment_test/widgets/map_view.dart';

import '../constants/theme/app_colors.dart';
import '../constants/theme/app_style.dart';

class PageOneUi extends StatefulWidget {
  static const String route = '/first-page';
  const PageOneUi({super.key});

  @override
  State<PageOneUi> createState() => _PageOneUiState();
}

class _PageOneUiState extends State<PageOneUi> {
  late LocationBloc locationBloc = BlocProvider.of<LocationBloc>(context);
  late GpsBloc gpsBloc = BlocProvider.of<GpsBloc>(context);

  @override
  void initState() {
    super.initState();
    locationBloc.getCurrentPosition();
    locationBloc.startFollowingUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null) {
            return Align(
                alignment: Alignment.center,
                child: Text(
                  'Please check your location settings',
                  style: appStyle(20, Colors.black, FontWeight.w600),
                ));
          }
          return BlocBuilder<MapBloc, MapState>(
            builder: (context, state) {
              Map<String, Polyline> polylinesToShow = Map.from(state.polylines);
              if (!state.showMyRoute) {
                polylinesToShow.removeWhere((key, value) => key == 'myRoute');
              }
              return Stack(
                children: [
                  Positioned.fill(
                    child: MapView(
                      initialLocation: locationState.lastKnownLocation!,
                      polylines: polylinesToShow.values.toSet(),
                      markers: state.markers.values.toSet(),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 30,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:
                          const Icon(Icons.menu, color: Colors.white, size: 25),
                    ),
                  ),
                  const Positioned(
                    right: 30,
                    top: 50,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
                    ),
                  ),
                  Positioned(
                    top: 420,
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: const RideInfoWidget(),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class RideInfoWidget extends StatefulWidget {
  const RideInfoWidget({super.key});

  @override
  State<RideInfoWidget> createState() => _RideInfoWidgetState();
}

class _RideInfoWidgetState extends State<RideInfoWidget> {
  // bool isSelected = false;
  final List<bool> _isSelected = [false, false, false];
  final List<String> cars = ['Toyota Camry', 'Lexus R700', 'Mercedes W90'];
  final List<String> prices = ['\$7,00', '\$9,00', '\$10,00'];
  String selectedPrice = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Choose your ride',
                  style: appStyle(18, AppColors.textColor, FontWeight.w600),
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.cardColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Icon(Icons.arrow_back_ios,
                      size: 20, color: AppColors.textColor),
                ),
              ],
            ),
          ),
          const Divider(),
          for (int i = 0; i < 3; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  if (!_isSelected[i]) {
                    for (int j = 0; j < 3; j++) {
                      _isSelected[j] = false;
                    }
                    _isSelected[i] = true;
                    selectedPrice = prices[i];
                  }
                });
              },
              child: Container(
                color: _isSelected[i] ? Colors.purple : null,
                child: ListTile(
                  title: Text(
                    cars[i],
                    style: appStyle(
                        16,
                        _isSelected[i] ? Colors.white : AppColors.textColor,
                        FontWeight.w600),
                  ),
                  trailing: Text(
                    prices[i],
                    style: appStyle(
                        14,
                        _isSelected[i] ? Colors.white : AppColors.textColor,
                        FontWeight.w500),
                  ),
                  subtitle: Text('2-3 person',
                      style: appStyle(
                          12,
                          _isSelected[i] ? Colors.white : AppColors.textColor,
                          FontWeight.w500)),
                ),
              ),
            ),
          5.sbh,
          CustomButton(
            isPayment: true,
            priceTapedValue: selectedPrice,
            bookCar: () {
              Navigator.pushNamed(
                context,
                PageTwoUi.route,
              );
            },
          )
        ],
      ),
    );
  }
}
