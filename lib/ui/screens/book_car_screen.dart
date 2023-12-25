import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';
import 'package:rental_car/ui/screens/home_screen.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Model/featured_car_model.dart';
import '../widgets/calender_time_widget.dart';

class BookCarScreen extends StatefulWidget {
  final FeaturedCarsModel items;
  final int index;
  const BookCarScreen({super.key, required this.index, required this.items});

  @override
  State<BookCarScreen> createState() => _BookCarScreenState();
}

class _BookCarScreenState extends State<BookCarScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SizedBox(
        height: 100.h,
        child: Stack(
          children: [
            // MARK: - Background Image.
            Positioned(
              top: 2.h,
              child: Container(
                height: 35.h,
                width: 100.w,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/next bg.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    // MARK: - Back Button.
                    Row(
                      children: [
                        SizedBox(width: 2.w),
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
                        SizedBox(height: 5.h),
                      ],
                    ),
                    SizedBox(height: 2.h),
                    // MARK: - Renter Image.
                    Row(
                      children: [
                        SizedBox(width: 70.w),
                        Container(
                          height: 8.h,
                          width: 17.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(255, 109, 109, 109),
                                width: 1.2),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              image: AssetImage('assets/img/profile.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            // MARK: - Car Details.
            Positioned(
              top: 35.h,
              child: SlideInUp(
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
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: SlideInUp(
                      duration: const Duration(milliseconds: 1800),
                      delay: const Duration(milliseconds: 100),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 8.h),
                          // MARK: - Car Details & Price.
                          Row(
                            children: [
                              Text(
                                'Rent Details',
                                style: theme.headlineMedium!.copyWith(
                                  letterSpacing: 1.5,
                                  fontSize: 19.5.sp,
                                  color: Colors.white,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                widget.items.pricePerDay,
                                style: theme.headlineMedium!.copyWith(
                                  letterSpacing: 1.5,
                                  fontSize: 19.5.sp,
                                  color: const Color.fromARGB(255, 255, 196, 0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4.h),
                          // MARK: - Rent location.
                          Container(
                            height: 8.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: const Color.fromARGB(255, 37, 53, 61)),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/icons/location.png',
                                  height: 3.h,
                                  color: Colors.amber,
                                ),
                              ),
                              title: Padding(
                                padding:
                                    EdgeInsets.only(left: 4.w, bottom: 0.5.h),
                                child: Text(
                                  'Pickup Location',
                                  style: theme.titleLarge!.copyWith(
                                    color: const Color.fromARGB(
                                        255, 214, 214, 214),
                                    fontSize: 17.5.sp,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              subtitle: Padding(
                                padding: EdgeInsets.only(left: 4.w),
                                child: Text(
                                  'Cairo, Misr El-Gdida',
                                  style: theme.displayLarge!.copyWith(
                                    color: Colors.white,
                                    fontSize: 17.5.sp,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          // MARK: - Pick up Date & Time.
                          const CalenderAndTimeWidget(
                            calender: 'Pick-up-Date',
                            time: 'Pick up Time',
                          ),
                          SizedBox(height: 3.h),
                          // MARK: - Drop off Date & Time.
                          const CalenderAndTimeWidget(
                            calender: 'Drop off Date',
                            time: 'Drop off Time',
                          ),
                          SizedBox(height: 8.h),
                          // MARK: - Proceed to Payment Button.
                          FadeInLeft(
                            delay: const Duration(milliseconds: 500),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomeScreen()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.orange,
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Text(
                                      'Proceed to Payment',
                                      style: theme.headlineMedium!.copyWith(
                                        fontSize: 18.sp,
                                        color: const Color.fromARGB(
                                            255, 53, 53, 53),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // MARK: - Car Image.
            widget.index == 0
                ? Positioned(
                    top: 20.h,
                    left: 9.w,
                    right: 8.w,
                    child: SlideInRight(
                      duration: const Duration(milliseconds: 1800),
                      delay: const Duration(milliseconds: 100),
                      child: Container(
                        height: 25.h,
                        width: 100.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img/bookCarImg.png'),
                          ),
                        ),
                      ),
                    ),
                  )
                : Positioned(
                    top: 18.h,
                    child: Container(
                      height: 25.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.items.img),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
