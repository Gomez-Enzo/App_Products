import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  const AuthBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        children: [
          const _PurpleBox(),
          SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 30.sp),
              child: Icon(
                Icons.person_pin,
                color: Colors.white,
                size: 100.sp,
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40.h,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 178, 1),
          ],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 90.sp,
            left: 30.sp,
            child: const _Circles(),
          ),
          Positioned(
            top: -40.sp,
            left: -30.sp,
            child: const _Circles(),
          ),
          Positioned(
            top: -50.sp,
            right: -20.sp,
            child: const _Circles(),
          ),
          Positioned(
            bottom: -50.sp,
            left: 10.sp,
            child: const _Circles(),
          ),
          Positioned(
            bottom: 120.sp,
            right: 20.sp,
            child: const _Circles(),
          ),
        ],
      ),
    );
  }
}

class _Circles extends StatelessWidget {
  const _Circles();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 100.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.sp),
        color: const Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
