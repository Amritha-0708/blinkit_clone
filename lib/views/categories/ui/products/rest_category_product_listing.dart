import 'package:blinkit_clone/api/api_call.dart';
import 'package:blinkit_clone/models/product_details.dart';
import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestCategoryProductListing extends StatefulWidget {
  final String dataLink;
  const RestCategoryProductListing({super.key, required this.dataLink});

  @override
  State<RestCategoryProductListing> createState() =>
      _RestCategoryProductListingState();
}

class _RestCategoryProductListingState
    extends State<RestCategoryProductListing> {
  List<ProductDetails> products = [];
  Map<int, int> quantities = {};

  final apiCall = ApiCall();
  @override
  void initState() {
    super.initState();
    loadMoreData();
    loadQuantity();
  }

  void loadQuantity() {
    setState(() {
      quantities = {
        for (int i = 0; i < products.length; i++) i: 0,
      };
    });
  }

  Future<void> loadMoreData() async {
    final List<ProductDetails>? data =
        await apiCall.getStoreData(dataLink: widget.dataLink);
    setState(() {
      products = data!;
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
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.55,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        product.image ?? "",
                        height: 100.h,
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
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Quantity(count: quantities[index] ?? 0),
                      )
                    ],
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
                      "1 piece",
                      style: TextStyle(
                          fontFamily: "Celias Regular",
                          color: Colors.black,
                          fontSize: 10.sp,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                  Text(
                    "1 days",
                    style: TextStyle(
                      fontFamily: "Celias Bold",
                      color: Colors.black,
                      fontSize: 15.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      RatingBarIndicator(
                        rating: product.rating?.rate ?? 5,
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemCount: 5,
                        itemSize: 10.0,
                        direction: Axis.horizontal,
                      ),
                      Text(
                        "(${product.rating?.count})",
                        style: TextStyle(
                            fontFamily: "Celias Regular",
                            color: Colors.black,
                            fontSize: 15.sp,
                            overflow: TextOverflow.ellipsis),
                      )
                    ],
                  ),
                  Text(
                    "\u20B9${product.price.toString()}",
                    style: TextStyle(
                        fontFamily: "Celias Bold",
                        color: Colors.black,
                        fontSize: 15.sp,
                        overflow: TextOverflow.ellipsis),
                  )
                ],
              );
            },
          );
  }
}

class Quantity extends StatefulWidget {
  int count;
  Quantity({super.key, required this.count});

  @override
  State<Quantity> createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  void _increaseCount() {
    setState(() {
      widget.count++;
    });
  }

  void _decreaseCount() {
    setState(() {
      widget.count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.count == 0
        ? GestureDetector(
            onTap: () => _increaseCount(),
            child: Container(
              padding: EdgeInsets.all(8.0.r),
              decoration: BoxDecoration(
                  color: AppColors.pastelGreen,
                  border: Border.all(color: AppColors.textGreen),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Text(
                "ADD",
                style: TextStyle(
                  fontFamily: "Celias Regular",
                  color: AppColors.textGreen,
                  fontSize: 10.sp,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              color: AppColors.textGreen,
              border: Border.all(color: AppColors.textGreen),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => _decreaseCount(),
                  child: Container(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      "-",
                      style: TextStyle(
                        fontFamily: "Celias Regular",
                        color: Colors.white,
                        fontSize: 20.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                Text(
                  "${widget.count}",
                  style: TextStyle(
                    fontFamily: "Celias Regular",
                    color: Colors.white,
                    fontSize: 15.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: () => _increaseCount(),
                  child: Container(
                    padding: EdgeInsets.all(8.0.r),
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontFamily: "Celias Regular",
                        color: Colors.white,
                        fontSize: 20.sp,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
