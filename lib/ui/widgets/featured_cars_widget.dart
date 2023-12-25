import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/car_details_screen.dart';
import '../../Model/featured_car_model.dart';

class FeaturedCarsWidget extends StatelessWidget {
  final FeaturedCarsModel items;
  final int index;
  const FeaturedCarsWidget({
    super.key,
    required this.index,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(index: index, items: items),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 4.w),
        width: 45.w,
        decoration: const BoxDecoration(),
        child: Stack(
          children: [
            // MARK: - Car Name and Price.
            Positioned(
              top: 4.h,
              child: Container(
                height: 14.h,
                margin: EdgeInsets.only(right: 4.w),
                width: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 56, 57, 58),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 6.h),
                      // MARK: - Car Name.
                      Text(
                        items.carName,
                        style: theme.displayLarge!.copyWith(
                          letterSpacing: 0.5,
                          fontSize: 17.5.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 1.h),
                      // MARK: - Car Price.
                      Text(
                        items.pricePerDay,
                        style: theme.displayMedium!.copyWith(
                          letterSpacing: 1.5,
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // MARK: - Car Image.
            Positioned(
              left: 3.5.w,
              child: Container(
                height: 9.h,
                width: 40.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(items.img),
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
