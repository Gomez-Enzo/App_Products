import 'package:app_products/home/cubit/home_cubit.dart';
import 'package:app_products/home/widgets/product_card.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/products/views/create_products_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products_client/products_client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const name = 'home';
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeCubit(
            productsClient: context.read<ProductsClient>(),
          ),
        ),
      ],
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(context.l10n.products),
        ),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.isSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  final product = state.products[index];
                  context.pushNamed(
                    CreateProductsPage.name,
                    extra: <String, Product?>{
                      'product': product,
                    },
                  );
                },
                child: ProductCard(
                  product: state.products[index],
                  index: index,
                ),
              ),
            );
          } else if (state.isFailure) {}
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.indigo,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
