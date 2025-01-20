import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Utils {
  static Container SeeAllProducts() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: AppColors.headerGrey,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "See all Products",
            style: TextStyle(
              fontFamily: "Celias Bold",
              color: Color.fromARGB(255, 34, 89, 104),
              fontSize: 15.sp,
            ),
          ),
          Icon(
            Icons.play_arrow,
            color: Color.fromARGB(255, 34, 89, 104),
          ),
        ],
      ),
    );
  }
}
