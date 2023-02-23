import 'package:app_products/home/views/home_page.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/products/cubit/product_cubit.dart';
import 'package:app_products/products/widgets/product_image.dart';
import 'package:app_products/utils/validators.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_client/products_client.dart';
import 'package:products_ui/products_ui.dart';

class CreateProductsPage extends StatelessWidget {
  const CreateProductsPage({
    super.key,
    this.product,
  });

  static const name = 'products';

  final Product? product;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ProductCubit(
            productClient: context.read<ProductsClient>(),
            product: product,
          ),
        ),
      ],
      child: CreateProductView(
        product: product,
      ),
    );
  }
}

class CreateProductView extends StatefulWidget {
  const CreateProductView({
    required this.product,
    super.key,
  });

  final Product? product;

  @override
  State<CreateProductView> createState() => _CreateProductViewState();
}

class _CreateProductViewState extends State<CreateProductView> {
  late bool _isAvailable = widget.product?.available ?? false;
  late final TextEditingController _productName;
  late final TextEditingController _productPicture;
  late final TextEditingController _productPrice;

  @override
  void initState() {
    super.initState();
    _productName = TextEditingController(text: widget.product?.name);
    _productPicture = TextEditingController(text: widget.product?.picture);
    _productPrice = TextEditingController(
      text: widget.product?.price.toString(),
    );
  }

  @override
  void dispose() {
    _productName.dispose();
    _productPicture.dispose();
    _productPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ProductImage(
                  url: _productPicture.text,
                ),
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
                        controller: _productName,
                        validator: (value) => validateName(value, context),
                        hintText: context.l10n.productName,
                        labelText: context.l10n.name,
                      ),
                      SizedBox(
                        height: 17.sp,
                      ),
                      ProductsTextFormField(
                        keyboardType: TextInputType.number,
                        controller: _productPrice,
                        handlePassword: false,
                        hintText: r'$150',
                        labelText: context.l10n.price,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      SwitchListTile.adaptive(
                        value: _isAvailable,
                        title: Text(context.l10n.available),
                        activeColor: Colors.indigo,
                        onChanged: (value) {
                          setState(() {
                            _isAvailable = value;
                          });
                        },
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
        onPressed: () {
          final product = Product(
            id: widget.product?.id,
            picture: _productPicture.text,
            available: _isAvailable,
            name: _productName.text,
            price: double.parse(_productPrice.text),
          );
        },
        child: const Icon(Icons.save_outlined),
      ),
    );
    ;
  }
}
