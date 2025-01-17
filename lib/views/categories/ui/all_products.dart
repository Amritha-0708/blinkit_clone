import 'package:blinkit_clone/views/categories/ui/products/category_product_listing.dart';
import 'package:blinkit_clone/views/categories/ui/products/category_listing.dart';
import 'package:blinkit_clone/views/categories/ui/products/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.0.h,
            ),
            Image.asset("assets/images/pet_care.png"),
            SizedBox(
              height: 12.0.h,
            ),
            Text(
              "Today's Special",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            ProductList(
              jsonFile: "data/todays_special.json",
            ),
            SizedBox(
              height: 12..h,
            ),
            Text(
              "Grocery & Kitchen",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            CategoryListing(jsonFile: "data/kitchen_grocery.json"),
            SizedBox(
              height: 12.sp,
            ),
            Text(
              "Snacks & Drinks",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            CategoryListing(jsonFile: "data/snacks_drinks.json"),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Chocolates & Waffers",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            CategoryProductListing(jsonFile: "data/chocolates_waffers.json"),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Cold Drinks & Jucies",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            CategoryProductListing(jsonFile: "data/softdrinks.json"),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "Diary",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            CategoryProductListing(jsonFile: "data/dairy.json"),
            SizedBox(
              height: 12.h,
            )
          ],
        ),
      ),
    );
  }
}
