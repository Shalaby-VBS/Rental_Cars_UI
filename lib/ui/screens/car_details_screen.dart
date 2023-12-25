// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Model/car_parts_model.dart';
import '../../Model/featured_car_model.dart';
import 'book_car_screen.dart';
import '../widgets/car_parts_widget.dart';

class DetailScreen extends StatelessWidget {
  final FeaturedCarsModel items;
  final int index;
  const DetailScreen({super.key, required this.index, required this.items});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            // MARK: - AppBar.
            Container(
              height: 45.h,
              width: 100.w,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/bg map.jpg'),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SizedBox(width: 2.w),
                      // MARK: - Back Button.
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          size: 24.sp,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      // MARK: - AppBar Title.
                      Text(
                        'Car Details',
                        style: theme.displaySmall!.copyWith(
                          fontSize: 21.sp,
                          color: Colors.black,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // MARK: - Car Details.
            Positioned(
              top: 35.h,
              child: Container(
                height: 70.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(45)),
                  color: Color.fromARGB(255, 22, 21, 21),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 6.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      // MARK: - Car Type.
                      Row(
                        children: [
                          // MARK: - Car Type.
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 53, 53, 53),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                              child: Text(
                                'SUV Car',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.amber,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          SizedBox(width: 3.w),
                          // MARK: - Car Type.
                          Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 53, 53, 53),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 4.w, right: 4.w, top: 1.h, bottom: 1.h),
                              child: Text(
                                'Off Road',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.amber,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const Spacer(),
                          // MARK: - Car Image.
                          Image.asset(
                            'assets/icons/lambo.png',
                            height: 6.5.h,
                          ),
                          SizedBox(width: 6.w)
                        ],
                      ),
                      SizedBox(height: 3.h),
                      // MARK: - Car Name.
                      Text(
                        '${items.carName} (2022)',
                        style: theme.headlineMedium!.copyWith(
                          fontSize: 20.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      // MARK: - Car Price.
                      Text(
                        items.pricePerDay,
                        style: theme.headlineMedium!.copyWith(
                          letterSpacing: 1.5,
                          fontSize: 19.5.sp,
                          color: const Color.fromARGB(255, 255, 196, 0),
                        ),
                      ),
                      SizedBox(height: 1.5.h),
                      // MARK: - Car Parts.
                      FadeInLeft(
                        child: SizedBox(
                          height: 19.h,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: CarPartsModel.carPartsList.length,
                            itemBuilder: (context, index) {
                              return CarPartsWidget(
                                index: index,
                                carItems: CarPartsModel.carPartsList[index],
                              );
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      // MARK: - Book Car Button.
                      Padding(
                        padding: EdgeInsets.only(right: 4.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookCarScreen(
                                  index: index,
                                  items: items,
                                ),
                              ),
                            );
                          },
                          child: FadeInUp(
                            delay: Duration(milliseconds: 200),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.orange,
                              ),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(14.0),
                                  child: Text(
                                    'Book Car',
                                    style: theme.headlineMedium!.copyWith(
                                      fontSize: 19.sp,
                                      color:
                                          const Color.fromARGB(255, 53, 53, 53),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            // MARK: - Car Image.
            index == 0
                ? Positioned(
                    top: 18.h,
                    left: 10.w,
                    child: SlideInRight(
                      duration: Duration(milliseconds: 1900),
                      delay: Duration(milliseconds: 100),
                      child: Container(
                        height: 25.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/detailImg.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    top: 18.h,
                    child: FadeInLeft(
                      child: Container(
                        height: 25.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(items.img),
                            fit: BoxFit.fill,
                          ),
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
