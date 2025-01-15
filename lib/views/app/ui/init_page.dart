import 'dart:async';

import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => context.go("/home_page"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundYellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "blink",
                    style: TextStyle(
                      fontFamily: "Celias Bold",
                      color: Colors.black,
                      fontSize: 40.sp,
                    ),
                  ),
                  TextSpan(
                    text: "it",
                    style: TextStyle(
                      fontFamily: "Celias Bold",
                      color: Colors.green,
                      fontSize: 40.sp,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "India's Last Minute App",
              style: TextStyle(
                fontFamily: "Celias Bold",
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
            Text(
              "prime",
              style: TextStyle(
                fontFamily: "Celias Bold Italic",
                color: AppColors.primeBlue,
                fontSize: 30.sp,
              ),
            )
          ],
        ),
      ),
    );
  }
}
