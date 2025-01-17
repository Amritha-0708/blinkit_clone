import 'package:blinkit_clone/views/categories/ui/products/rest_category_product_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Fashion extends StatelessWidget {
  const Fashion({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Men's Clothing",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            RestCategoryProductListing(
              dataLink:
                  "https://fakestoreapi.com/products/category/men's%20clothing",
            ),
            SizedBox(
              height: 12..h,
            ),
            Text(
              "Women's Clothing",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            RestCategoryProductListing(
              dataLink:
                  "https://fakestoreapi.com/products/category/women's%20clothing",
            ),
            SizedBox(
              height: 12..h,
            ),
            Text(
              "Jewelery",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            RestCategoryProductListing(
              dataLink: "https://fakestoreapi.com/products/category/jewelery",
            ),
            SizedBox(
              height: 12..h,
            ),
          ],
        ),
      ),
    );
  }
}
