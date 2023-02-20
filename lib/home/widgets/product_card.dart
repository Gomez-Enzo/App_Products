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
            _BackgroundImage(product.picture),
            _ProductDetails(
              name: product.name,
              id: product.id,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: _Tags(
                text: product.price.toString(),
              ),
            ),
            if (!product.available)
              Positioned(
                top: 0,
                left: 0,
                child: _Tags(
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
  const _BackgroundImage(this.url);

  final String? url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25.sp),
      child: SizedBox(
        width: double.infinity,
        height: 400.sp,
        child: url != null
            ? FadeInImage(
                placeholder: const AssetImage('assets/img/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.contain,
              )
            : const Image(
                image: AssetImage('assets/img/no-image.png'),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}

class _ProductDetails extends StatelessWidget {
  const _ProductDetails({
    required this.name,
    this.id,
  });

  final String name;
  final String? id;

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
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            id ?? '',
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
    this.text,
  });

  final Color? color;
  final String? text;
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
            text == null ? 'No disponible' : '\$$text',
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
