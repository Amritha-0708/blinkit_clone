import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 2.0.r,
          title: Text(
            "Profile",
            style: TextStyle(
              fontFamily: "Celias Regular",
              fontSize: 20.sp,
              color: Colors.black,
            ),
          ),
          shadowColor: AppColors.headerGrey,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 12.0.h,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              child: Text(
                "My Account",
                style: TextStyle(
                  fontFamily: "Celias Bold",
                  fontSize: 20.sp,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 10.0.h),
              child: Text(
                "9876543213",
                style: TextStyle(
                  fontFamily: "Celias Regular",
                  fontSize: 12.sp,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0.h,
                        horizontal: 20.0.w,
                      ),
                      padding: EdgeInsets.all(32.0.r),
                      decoration: BoxDecoration(
                          color: AppColors.pastelYellow,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Icon(
                                  Icons.wallet,
                                ),
                                Text(
                                  "Wallets",
                                  style: TextStyle(
                                    fontFamily: "Celias Regular",
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Icon(
                                  Icons.contact_support_outlined,
                                ),
                                Text(
                                  "Support",
                                  style: TextStyle(
                                    fontFamily: "Celias Regular",
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Column(
                              children: [
                                Icon(
                                  Icons.credit_card,
                                ),
                                Text(
                                  "Payments",
                                  style: TextStyle(
                                    fontFamily: "Celias Regular",
                                    fontSize: 10.sp,
                                    color: Colors.black,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 10.0.h),
                      child: Text(
                        "YOUR INFORMATION",
                        style: TextStyle(
                          fontFamily: "Celias Regular",
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tile(text: "Your Orders", icon: Icons.list_alt_outlined),
                    Tile(text: "Bookmarked Recipes", icon: Icons.coffee),
                    Tile(text: "Address Book", icon: Icons.menu_book),
                    Tile(text: "GST Details", icon: Icons.list_alt_outlined),
                    Tile(text: "E-Gift Cards", icon: Icons.card_giftcard),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 10.0.h),
                      child: Text(
                        "PAYMENTS AND COUPONS",
                        style: TextStyle(
                          fontFamily: "Celias Regular",
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tile(text: "Wallet", icon: Icons.wallet),
                    Tile(text: "Payment Settings", icon: Icons.credit_card),
                    Tile(text: "Collected Coupons", icon: Icons.discount),
                    SizedBox(
                      height: 12.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0.w, vertical: 10.0.h),
                      child: Text(
                        "OTHER INFORMATIONS",
                        style: TextStyle(
                          fontFamily: "Celias Regular",
                          fontSize: 18.sp,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Tile(text: "Share the App", icon: Icons.share),
                    Tile(text: "About us", icon: Icons.error),
                    Tile(
                        text: "Get Feeding India Receipt",
                        icon: Icons.facebook),
                    Tile(text: "Account Privacy", icon: Icons.privacy_tip),
                    Tile(
                        text: "Notification Preference",
                        icon: Icons.notification_add_outlined),
                    Tile(text: "Logout", icon: Icons.logout),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Tile extends StatelessWidget {
  final String text;
  final IconData icon;
  const Tile({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.r),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Container(
            color: AppColors.backGroundGrey,
            padding: EdgeInsets.all(10.0.r),
            child: Icon(
              icon as IconData?,
              size: 13.r,
            ),
          ),
        ),
        title: Text(
          text,
          style: TextStyle(
            fontFamily: "Celias REGULAR",
            fontSize: 13.sp,
            color: Colors.black,
          ),
        ),
        trailing: Icon(Icons.navigate_next),
      ),
    );
  }
}
