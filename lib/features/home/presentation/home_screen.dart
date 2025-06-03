import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_car/features/home/presentation/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollPosition? currentScrollPosition;
  List<Widget> images = [
    Image.asset("assets/images/image1.png", fit: BoxFit.cover),
    Image.asset("assets/images/image1.png", fit: BoxFit.cover),
    Image.asset("assets/images/image1.png", fit: BoxFit.cover),
    Image.asset("assets/images/image1.png", fit: BoxFit.cover),
    Image.asset("assets/images/image1.png", fit: BoxFit.cover),
  ];
  List<List<dynamic>> carsAndNames = [
    ["assets/svgs/car1.svg", "Economy"],
    ["assets/svgs/Car2.svg", "Large"],
    ["assets/svgs/Car3.svg", "Vip"],
    ["assets/svgs/Car4.svg", "Pit"]
  ];
  final CarouselSliderController _controller = CarouselSliderController();
  int currentIndex = 0;
  int currentCarIndex = 0;
  int currentPassengersIndex = 0;
  int currentLuggageIndex = 0; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: 
          Stack(
            children:[ Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: 16.0.w, right: 16.0.w, top: 30.0.h, bottom: 15.h),
                    child: Column(
                      children: [
                        Row(children: [
                          Text(
                            "Good Morning Rania Ali!!",
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xff0D3244)),
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            "assets/svgs/notifications.svg",
                            width: 20.17.w,
                            height: 21.5.h,
                          ),
                        ]),
                        SizedBox(
                          height: 20.h,
                        ),

                        // Custom carousel slider *****************************************
                        SizedBox(
                          width: double.infinity,
                          child: CarouselSlider(
                            items: images
                                .map(
                                  (img) => Container(
                                    width: 242.w, // Increased width
                                    height: 98.h, // Increased height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12.r),
                                      child: img,
                                    ),
                                  ),
                                )
                                .toList(),
                            carouselController: _controller,
                            options: CarouselOptions(
                              height: 116.h,
                              viewportFraction: 0.7, // قلل الفاصل بين الصور
                              enlargeCenterPage: true,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        // Custom dot indicators   ****************************************
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(images.length, (index) {
                            final bool isActive = currentIndex == index;
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(index),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: EdgeInsets.symmetric(horizontal: 3.w),
                                height: 6.h,
                                width: 6.w,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? const Color(0xff0D3244)
                                      : const Color(0xffD9D9D9),
                                  borderRadius: BorderRadius.circular(100.r),
                                ),
                              ),
                            );
                          }),
                        ),
                 // List of cars and names   ****************************************
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 20, bottom: 10),
                          child: SizedBox(
                            width: 375.w,
                            height: 91.h,
                            child: Row(children: [
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: carsAndNames.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 25.0),
                                        child: Column(children: [
                                          InkWell(
                                            onTap: (){
                                              setState(() {
                                                currentCarIndex = index;
                                              });
                                            },
                                            child: Container(
                                              width: 63.w,
                                              height: 63.h,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8.r),
                                                  border: Border.all(
                                                    width: 1.w,
                                                    color: currentCarIndex == index
                                                        ? const Color(0xff344054)
                                                        : const Color(0xffE8EEFB),
                                                  ),
                                                  color: const Color(0xffE8EEFB)),
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  carsAndNames[index][0],
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Text(
                                            carsAndNames[index][1],
                                            style: TextStyle(
                                                color: const Color(0xff0D3244),
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                      );
                                    }),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    )),

                // Current location   ****************************************
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r)),
                        color: const Color(0xffEAECF0)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Current location',
                                  labelStyle: TextStyle(
                                      color: const Color(0xff475467),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.circle,
                                    color: const Color(0xff5F00FB),
                                    size: 8.w,
                                  ))),
                          SizedBox(
                            height: 8.h,
                          ),

                          // Where to   ****************************************
                          TextField(
                              decoration: InputDecoration(
                                  isDense: true,
                                  labelText: 'Where to?',
                                  labelStyle: TextStyle(
                                      color: const Color(0xff475467),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                  contentPadding: const EdgeInsets.all(5.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.circle,
                                    color: const Color(0xff60BF95),
                                    size: 8.w,
                                  ))),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            child: Text(
                              "Passengers no.",
                              style: TextStyle(
                                  color: const Color(0xff475467),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            ),
                          ),

                         // Passengers number.   ****************************************

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    currentPassengersIndex = index;
                                  });
                                },
                                child: Container(
                                    width: 51.w, // عدّلي حسب الحجم المناسب لك
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color:currentPassengersIndex == index ? const Color(0xff266FFF) :
                                       Colors.white,
                                    ),
                                    child: Center(
                                      child: Text('${index + 1}',
                                          style: TextStyle(
                                              color: currentPassengersIndex == index ? Colors.white :const Color(0xff04034C),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight
                                                  .w400)), // تباعد بسيط بين العناصر
                                    )),
                              );
                            }),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 13.h),
                            child: Text(
                              "Luggage no.",
                              style: TextStyle(
                                  color: const Color(0xff475467),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            ),
                          ),

                          // Luggage number.   ****************************************
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(6, (index) {
                              return InkWell(
                                onTap: (){
                                  setState(() {
                                    currentLuggageIndex = index;
                                },);
                                },
                                child: Container(
                                    width: 51.w, // عدّلي حسب الحجم المناسب لك
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: currentLuggageIndex == index ? const Color(0xFFCCCCCC) : Colors.white,
                                    ),
                                    child: Center(
                                      child: Text('${index }',
                                          style: TextStyle(
                                              color:currentLuggageIndex == index ? const Color(0xff959595) : const Color(0xff04034C),
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight
                                                  .w400)), // تباعد بسيط بين العناصر
                                    )),
                              );
                            }),
                          ),
                             // From to  Container ****************************************
                          Padding(
                            padding:  EdgeInsets.symmetric( vertical: 20.0.h),
                            child: Container(
                              width: double.infinity,
                              height:151.h ,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16.r) ), 
                                color: Colors.white,
                              ),
                               child: Padding(
                                  padding:  EdgeInsets.symmetric(horizontal: 14.0.w,vertical: 14.h),
                                  child: Column(
                                    children: [
                                          Row(
                                            children: [
                                                SvgPicture.asset("assets/svgs/from_to_image.svg"),
                                                 SizedBox(width: 8.w,),
                                              Column(
                                                 crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "From",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: const Color(0xff121212),
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                   SizedBox(height: 35.h,),
                                                  Text(
                                                    "To",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: const Color(0xff121212),
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.w600),
                                                  ),
                                                ],
                                              )
                                           
                                          ]),
                                          SizedBox(height: 30.h,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                            Row(children: [
                                              SvgPicture.asset("assets/svgs/noun_distance.svg"),
                                              SizedBox(width: 2.w,),
                                              Text(
                                                "-- Km",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: const Color(0xff121212),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],),
                                             Row(children: [
                                              SvgPicture.asset("assets/svgs/noun_time.svg"),
                                              SizedBox(width: 2.w,),
                                              Text(
                                                "-- Mins",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: const Color(0xff121212),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],),
                                             Row(children: [
                                              SvgPicture.asset("assets/svgs/noun_passenger.svg"),
                                              SizedBox(width: 2.w,),
                                              Text(
                                                "4 Passengers",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                    color: const Color(0xff121212),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400),
                                              ),
                                            ],)

                                            ])
                                      ]))
                              ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
            
            //  FloatingActionButton ****************************************
            Positioned(
             top: MediaQuery.of(context).size.height / 2 -10.h, // منتصف الصفحة عموديًا - نص ارتفاع الزر
        right: 35.w, 
        child: SizedBox(
          height: 30.h,
          width: 30.w,
          child: FloatingActionButton.extended(
            onPressed: () {},
            backgroundColor: const Color(0xff266FFF),
            label: SvgPicture.asset("assets/svgs/floating_image.svg"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r), // زوايا ناعمة أكثر
            ),
          ),
        ),
      ),

  ]),
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(),

    );
  }
}
