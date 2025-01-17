import 'dart:convert';
import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductList extends StatefulWidget {
  final String jsonFile;
  const ProductList({super.key, required this.jsonFile});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    final String response = await rootBundle.loadString(widget.jsonFile);
    final data = json.decode(response);
    setState(() {
      products = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 300.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return SizedBox(
                  width: 120.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        product['image'],
                        height: 150.h,
                        width: 100.w,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0.w,
                          vertical: 3.0.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0.r),
                          color: AppColors.quantityColor,
                        ),
                        child: Text(
                          product['quantity'],
                          style: TextStyle(
                              fontFamily: "Celias Regular",
                              color: Colors.black,
                              fontSize: 10.sp,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        product['title'],
                        style: TextStyle(
                            fontFamily: "Celias Bold",
                            color: Colors.black,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: double.parse(product['rating']['rate']),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            itemCount: 5,
                            itemSize: 10.0,
                            direction: Axis.horizontal,
                          ),
                          Text(
                            "(${product['rating']['count']})",
                            style: TextStyle(
                                fontFamily: "Celias Regular",
                                color: Colors.black,
                                fontSize: 15.sp,
                                overflow: TextOverflow.ellipsis),
                          )
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 20.sp,
                            color: AppColors.textGreen,
                          ),
                          Text("${product['time']}")
                        ],
                      ),
                      Text(
                        "\u20B9${product['price']}",
                        style: TextStyle(
                            fontFamily: "Celias Bold",
                            color: Colors.black,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}
