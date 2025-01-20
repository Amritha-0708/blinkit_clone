import 'package:blinkit_clone/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityControl extends StatelessWidget {
  final int count;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityControl({
    super.key,
    required this.count,
    required this.onAdd,
    required this.onRemove,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return count == 0
        ? GestureDetector(
            onTap: onAdd,
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
                  onTap: count > 1 ? onDecrement : onRemove,
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
                  "$count",
                  style: TextStyle(
                    fontFamily: "Celias Regular",
                    color: Colors.white,
                    fontSize: 15.sp,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                GestureDetector(
                  onTap: onIncrement,
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
