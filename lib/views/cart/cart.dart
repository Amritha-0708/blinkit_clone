import 'package:blinkit_clone/main.dart';
import 'package:blinkit_clone/models/product_details.dart';
import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:blinkit_clone/views/categories/ui/bloc/cart_bloc.dart';
import 'package:blinkit_clone/views/categories/ui/products/rest_category_product_listing.dart';
import 'package:blinkit_clone/views/quantity_control/QuantityControl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.headerGrey,
        appBar: AppBar(
          title: Text(
            "Checkout",
            style: TextStyle(
              fontFamily: "Celias Regular",
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
          actions: [
            Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.textGreen,
              size: 16.r,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Share",
                style: TextStyle(
                  fontFamily: "Celias Regular",
                  fontSize: 16.sp,
                  color: AppColors.textGreen,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is LoadedCartState) {
                        Map<ProductDetails, double> cartItems = state.cartItems;
                        double totalAmount = state.totalAmount;
                        return Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.timer),
                                SizedBox(
                                  width: 12.w,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Delivery in 11 minutes",
                                      style: TextStyle(
                                        fontFamily: "Celias Regular",
                                        fontSize: 18.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Shipment of ${cartItems.entries.length} items",
                                      style: TextStyle(
                                        fontFamily: "Celias Regular",
                                        fontSize: 12.sp,
                                        color: AppColors.headerGrey,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 12.h),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: cartItems.entries.length,
                              itemBuilder: (context, index) {
                                final entry =
                                    cartItems.entries.elementAt(index);
                                final product = entry.key;
                                final double quantity = entry.value;
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16.0,
                                  ),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      top: BorderSide(
                                        color: AppColors.headerGrey,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(
                                        product.image ?? "",
                                        height: 100.h,
                                        width: 100.h,
                                      ),
                                      SizedBox(
                                        width: 150.w,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              product.title ?? "",
                                              style: TextStyle(
                                                fontFamily: "Celias Regular",
                                                fontSize: 18.sp,
                                                color: Colors.black,
                                              ),
                                              overflow: TextOverflow.visible,
                                            ),
                                            Text(
                                              "Save for later",
                                              style: TextStyle(
                                                  fontFamily: "Celias Regular",
                                                  fontSize: 12.sp,
                                                  color: AppColors.headerGrey,
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .dashed),
                                            )
                                          ],
                                        ),
                                      ),
                                      QuantityControl(
                                        count: quantity.toInt(),
                                        onAdd: () => cartBloc.add(
                                          AddProductToCartEvent(product),
                                        ),
                                        onRemove: () => cartBloc.add(
                                          RemoveProductFromCartEvent(product),
                                        ),
                                        onIncrement: () => cartBloc.add(
                                          UpdateIncrementProductInCartEvent(
                                              product),
                                        ),
                                        onDecrement: () => cartBloc.add(
                                          UpdateDecrementProductInCartEvent(
                                              product),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.network(
                        "https://img.freepik.com/premium-photo/banner-with-gift-box-shape-heart-red-background-valentine-s-day-gift-concept-wide-banner-with-space-text-concept-promotion-sale-shopping_436767-222.jpg",
                      ),
                    ),
                    Positioned(
                      right: 50.w,
                      top: 50.w,
                      child: Column(
                        children: [
                          Text(
                            "Gifts wrapping",
                            style: TextStyle(
                              fontFamily: "Celias Bold",
                              fontSize: 20.sp,
                              color: Colors.white,
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              "Select",
                              style: TextStyle(
                                fontFamily: "Celias Bold",
                                fontSize: 20.sp,
                                color: AppColors.textGreen,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                  padding: EdgeInsets.all(16.0.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "You might also like",
                        style: TextStyle(
                          fontFamily: "Celias Bold",
                          color: Colors.black,
                          fontSize: 20.sp,
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      RestCategoryProductListing(
                        dataLink: "https://fakestoreapi.com/products/",
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
