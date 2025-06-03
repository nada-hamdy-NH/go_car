import 'package:curved_labeled_gradient_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_gradient_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 80.h,
      color: Colors.white,
      backgroundColor: Colors.white,
      items: [
        CurvedNavigationBarItem(
            child: _currentIndex == 0
                ? SvgPicture.asset("assets/svgs/home.svg",
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn))
                : SvgPicture.asset(
                    "assets/svgs/home1.svg",
                  ),
            label: _currentIndex == 0 ? 'Home' : '',
            labelStyle: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF183E91), Color(0xFF266FFF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(const Rect.fromLTWH(0, 0, 200, 70)),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            )),
        CurvedNavigationBarItem(
            child: _currentIndex == 1
                ? SvgPicture.asset("assets/svgs/noun_calendar1.svg")
                : SvgPicture.asset("assets/svgs/noun_calendar.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0xffABB7C2), BlendMode.srcIn)),
            label: _currentIndex == 1 ? 'Calendar' : '',
            labelStyle: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF183E91), Color(0xFF266FFF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            )),
        CurvedNavigationBarItem(
            child: _currentIndex == 2
                ? SvgPicture.asset(
                    "assets/svgs/noun_wallet1.svg",
                  )
                : SvgPicture.asset("assets/svgs/noun_wallet.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0xffABB7C2), BlendMode.srcIn)),
            label: _currentIndex == 2 ? 'Wallet' : '',
            labelStyle: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF183E91), Color(0xFF266FFF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            )),
        CurvedNavigationBarItem(
            child: _currentIndex == 3
                ? SvgPicture.asset(
                    "assets/svgs/noun_profile1.svg",
                  )
                : SvgPicture.asset("assets/svgs/noun_profile.svg",
                    colorFilter: const ColorFilter.mode(
                        Color(0xffABB7C2), BlendMode.srcIn)),
            label: _currentIndex == 3 ? 'Profile' : '',
            labelStyle: TextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: [Color(0xFF183E91), Color(0xFF266FFF)],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
              fontSize: 12.sp,
              fontWeight: FontWeight.w700,
            )),
      ],
      buttonGradient: const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [Color(0xFF183E91), Color(0xFF266FFF)],
        transform: GradientRotation(85.84 * math.pi / 180),
      ),
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}

GradientText(text) {
  const gradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(0xFF183E91), Color(0xFF266FFF)],
    transform: GradientRotation(85.84 * math.pi / 180),
  );
  return ShaderMask(
    shaderCallback: (bounds) => gradient.createShader(
      Rect.fromLTWH(0, 0, bounds.width, bounds.height),
    ),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    ),
  );
}
