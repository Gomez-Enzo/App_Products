import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.sp,
        right: 10.sp,
        top: 10.sp,
      ),
      child: Container(
        width: double.infinity,
        height: 400.sp,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.sp),
            topRight: Radius.circular(45.sp),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: Offset(0, 5.sp),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45.sp),
            topRight: Radius.circular(45.sp),
          ),
          child: const FadeInImage(
            placeholder: AssetImage('assets/img/jar-loading.gif'),
            image: NetworkImage('https://via.placeholder.com/400x300/'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
