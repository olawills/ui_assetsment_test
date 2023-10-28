import 'package:flutter/material.dart';
import 'package:ui_assetsment_test/constants/extensions/spacer.dart';

import '../constants/theme/app_colors.dart';
import '../constants/theme/app_style.dart';
import '../widgets/custom_btn.dart';

class PageTwoUi extends StatelessWidget {
  static const String route = '/second-page';
  const PageTwoUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: double.maxFinite,
                height: 40,
                decoration: const BoxDecoration(
                  color: Colors.purple,
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.close,
                          color: Colors.black, size: 20),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  50.sbw,
                  Text(
                    'Rate Your Trip',
                    style: appStyle(18, AppColors.whiteColor, FontWeight.w600),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 140,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const UserInfo(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    int gottenStars = 4;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png'),
              ),
              title: Text(
                'Ben Stokes',
                style: appStyle(16, AppColors.textColor, FontWeight.w500),
              ),
              subtitle: const Row(
                children: [
                  Icon(
                    Icons.star,
                    color: AppColors.starColor,
                    size: 15,
                  ),
                  Text('4.9', style: TextStyle(color: Colors.grey)),
                ],
              ),
              trailing: Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(Icons.comment, color: Colors.white, size: 25),
              ),
            ),
            20.sbw,
            Center(
              child: Text('How is your trip?',
                  style: appStyle(20, AppColors.textColor, FontWeight.w600)),
            ),
            10.sbh,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Wrap(
                  children: List.generate(
                    5,
                    (index) {
                      return Icon(
                        Icons.star,
                        size: 50,
                        color: index < gottenStars
                            ? AppColors.starColor
                            : AppColors.unstar,
                      );
                    },
                  ),
                ),
              ],
            ),
            10.sbh,
            TextFormField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              textInputAction: TextInputAction.newline,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your feedback';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Write your feedback',
                fillColor: Colors.grey.shade100,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: AppColors.cardColor,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            20.sbh,
            Text(
              'Trip Detail',
              style: appStyle(18, AppColors.textColor, FontWeight.w600),
            ),
            10.sbh,
            Card(
              // color: AppColors.cardColor,
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.purple,
                        child: CircleAvatar(
                          radius: 6,
                          backgroundColor: Colors.white,
                        ),
                      ),
                      10.sbw,
                      Text(
                        'Skate Park',
                        style:
                            appStyle(15, AppColors.textColor, FontWeight.w500),
                      ),
                    ],
                  ),
                  const Divider(color: AppColors.cardColor),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          size: 30, color: Colors.red),
                      10.sbw,
                      Text(
                        'Home',
                        style:
                            appStyle(15, AppColors.textColor, FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            20.sbh,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Detail',
                  style: appStyle(18, AppColors.textColor, FontWeight.w600),
                ),
                10.sbh,
                const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Trip Expense'),
                        Text('\$9,00'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Discount Voucher'),
                        Text('\$1,00'),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total'),
                        Text('\$8,00'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            20.sbh,
            CustomButton(
              text: 'Submit',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
