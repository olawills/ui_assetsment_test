import 'package:flutter/material.dart';
import 'package:ui_assetsment_test/constants/extensions/spacer.dart';
import 'package:ui_assetsment_test/constants/theme/app_style.dart';

import '../constants/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final bool isPayment;
  final Function()? onTap;
  final Function()? bookCar;

  final String? priceTapedValue;
  const CustomButton({
    super.key,
    this.onTap,
    this.text,
    this.priceTapedValue,
    this.bookCar,
    this.isPayment = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height * 0.08,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.blackColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: isPayment
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Book this car',
                      style: appStyle(16, Colors.white, FontWeight.w500),
                    ),
                    Row(
                      children: [
                        Text(
                          priceTapedValue!,
                          style: appStyle(16, Colors.white, FontWeight.w500),
                        ),
                        10.sbw,
                        GestureDetector(
                          onTap: bookCar,
                          child: Container(
                            width: 40,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.cardColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: AppColors.textColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Text(
                text!,
                style: appStyle(16, Colors.white, FontWeight.w500),
              ),
      ),
    );
  }
}
