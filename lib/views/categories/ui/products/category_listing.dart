import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryListing extends StatefulWidget {
  final String jsonFile;
  const CategoryListing({super.key, required this.jsonFile});

  @override
  State<CategoryListing> createState() => _CategoryListingState();
}

class _CategoryListingState extends State<CategoryListing> {
  List<dynamic> products = [];
  @override
  void initState() {
    super.initState();
    loadMoreData();
  }

  Future<void> loadMoreData() async {
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
        : GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.65,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Image.asset(
                      product['image'],
                    ),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    product['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: "Celias Bold",
                      color: Colors.black,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              );
            },
          );
  }
}
