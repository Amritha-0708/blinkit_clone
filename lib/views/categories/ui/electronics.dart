import 'package:blinkit_clone/core/utils.dart';
import 'package:blinkit_clone/views/categories/ui/products/rest_category_product_listing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Electronics extends StatelessWidget {
  const Electronics({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Electronics & Applicances",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            RestCategoryProductListing(
              dataLink:
                  "https://fakestoreapi.com/products/category/electronics",
            ),
            SizedBox(
              height: 12.h,
            ),
            Utils.SeeAllProducts(),
            SizedBox(
              height: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
