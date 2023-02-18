import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:products_client/products_client.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    required this.product,
    required this.index,
    super.key,
  });

  final Product product;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp),
      child: Container(
        margin: EdgeInsets.only(top: 30.sp, bottom: 20.sp),
        width: double.infinity,
        height: 400.sp,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.sp),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.sp,
              offset: Offset(0, 10.sp),
            ),
          ],
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            const _BackgroundImage(),
            const _ProductDetails(),
            Positioned(
              top: 0,
              right: 0,
              child: _Tags(
                text: product.price.toString(),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: _Tags(
                text: 'No disponible',
                color: Colors.yellow[800],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.sp),
                  bottomRight: Radius.circular(25.sp),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.sp),
      child: SizedBox(
        width: double.infinity,
        height: 400.sp,
        child: const FadeInImage(
          placeholder: AssetImage('assets/img/jar-loading.gif'),
          image: NetworkImage('https://via.placeholder.com/400x300/f6f6f6'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.sp,
        vertical: 10.sp,
      ),
      width: 75.w,
      height: 70.sp,
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.sp),
          topRight: Radius.circular(25.sp),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Disco duro G',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'Id del disco duro',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _Tags extends StatelessWidget {
  const _Tags({
    this.borderRadius,
    this.color,
    this.text = 'text',
  });

  final Color? color;
  final String text;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.sp,
      height: 70.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color ?? Colors.indigo,
        borderRadius: borderRadius ??
            BorderRadius.only(
              topRight: Radius.circular(25.sp),
              bottomLeft: Radius.circular(25.sp),
            ),
      ),
      child: FittedBox(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.sp),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
        ),
      ),
    );
  }
}
