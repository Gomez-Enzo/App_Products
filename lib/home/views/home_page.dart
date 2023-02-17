import 'package:app_products/home/widgets/product_card.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/login/views/login_page.dart';
import 'package:app_products/products/views/create_products_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const name = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(context.l10n.products),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () => context.pushNamed(CreateProductsPage.name),
          child: const ProductCard(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
