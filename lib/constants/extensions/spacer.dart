import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension OnWidthSpacer on num {
  Widget get sbw => SizedBox(width: w);
}

extension OnHeightSpacer on num {
  Widget get sbh => SizedBox(height: h);
}
