import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Model/car_parts_model.dart';

class CarPartsWidget extends StatelessWidget {
  final CarPartsModel carItems;
  final int index;
  const CarPartsWidget(
      {super.key, required this.index, required this.carItems});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      margin: EdgeInsets.only(right: 3.w),
      width: 28.w,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Positioned(
            top: 6.h,
            child: Container(
              height: 13.h,
              margin: EdgeInsets.only(right: 1.w),
              width: 28.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color.fromARGB(255, 56, 57, 58),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 3.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      carItems.carParts1,
                      style: theme.headlineMedium!.copyWith(
                          letterSpacing: 0.5,
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      carItems.carParts2,
                      style: theme.displayMedium!.copyWith(
                          letterSpacing: 1.5,
                          fontSize: 17.sp,
                          color: Colors.amber,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 1.h,
            left: 3.w,
            child: Container(
              height: 9.h,
              margin: EdgeInsets.only(right: 0.w),
              width: 22.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    image: AssetImage(carItems.img), fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
