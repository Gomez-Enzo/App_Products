import 'package:app_products/home/views/home_page.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/products/widgets/product_image.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:products_ui/products_ui.dart';

class CreateProductsPage extends StatelessWidget {
  const CreateProductsPage({super.key});

  static const name = 'products';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const ProductImage(),
                Positioned(
                  top: 60.sp,
                  left: 20.sp,
                  child: IconButton(
                    onPressed: () => context.goNamed(HomePage.name),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                ),
                Positioned(
                  top: 60.sp,
                  right: 20.sp,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                      size: 40.sp,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.sp,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.sp),
                    bottomLeft: Radius.circular(25.sp),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: Offset(0, 5.sp),
                    ),
                  ],
                ),
                child: Form(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.sp,
                      ),
                      ProductsTextFormField(
                        handlePassword: false,
                        hintText: context.l10n.productName,
                        labelText: context.l10n.name,
                      ),
                      SizedBox(
                        height: 17.sp,
                      ),
                      ProductsTextFormField(
                        keyboardType: TextInputType.number,
                        handlePassword: false,
                        hintText: r'$150',
                        labelText: context.l10n.price,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SwitchListTile.adaptive(
                        value: true,
                        title: Text(context.l10n.available),
                        activeColor: Colors.indigo,
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100.sp,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.save_outlined),
      ),
    );
  }
}
