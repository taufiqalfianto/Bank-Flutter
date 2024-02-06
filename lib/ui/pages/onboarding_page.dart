import 'package:bank/shared/theme.dart';
import 'package:bank/ui/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentIndex = 0;

  CarouselController carouselController = CarouselController();

  List<String> titles = [
    'Grow Your\nFinancial Today',
    'Build From\nZero to Freedom',
    'Start Together',
  ];
  List<String> subtitles = [
    'Our system is helping you to\nachieve a better goal',
    'We provide tips for you so that you can adapt easier',
    'We will guide you to where\nyou wanted it too',
  ];

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: [
                    Image.asset(
                      'assets/img_onboarding1.png',
                      height: 45.h,
                    ),
                    Image.asset(
                      'assets/img_onboarding2.png',
                      height: 45.h,
                    ),
                    Image.asset(
                      'assets/img_onboarding3.png',
                      height: 45.h,
                    ),
                  ],
                  options: CarouselOptions(
                    height: 45.h,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.h),
                  padding: EdgeInsets.all(4.h),
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(3.h),
                  ),
                  child: Column(
                    children: [
                      Text(
                        titles[currentIndex],
                        style: blackTextStyle.copyWith(
                          fontSize: 15.sp,
                          fontWeight: semiBold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        subtitles[currentIndex],
                        style: greyTextStyle.copyWith(
                          fontSize: 13.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: currentIndex == 2 ? 38 : 50,
                      ),
                      currentIndex == 2
                          ? Column(
                              children: [
                                CustomFilledButton(
                                  title: 'Get Started',
                                  onpressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/sign-up',
                                      (route) => false,
                                    );
                                  },
                                ),
                                SizedBox(
                                  height: 3.h,
                                ),
                                CustomTextWidget(
                                  title: 'Sign In',
                                  onpressed: () {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/sign-in',
                                      (route) => false,
                                    );
                                  },
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                Container(
                                  height: 2.h,
                                  width: 2.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 0
                                        ? blueColor
                                        : lightBackgroundColor,
                                  ),
                                ),
                                Container(
                                  height: 12,
                                  width: 12,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 1
                                        ? blueColor
                                        : lightBackgroundColor,
                                  ),
                                ),
                                Container(
                                  height: 2.h,
                                  width: 2.h,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentIndex == 2
                                        ? blueColor
                                        : lightBackgroundColor,
                                  ),
                                ),
                                Spacer(),
                                CustomFilledButton(
                                  width: 35.w,
                                  height: 7.h,
                                  title: 'Continue',
                                  onpressed: () {
                                    carouselController.nextPage();
                                  },
                                )
                              ],
                            ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
