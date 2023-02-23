import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:products_client/products_client.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required ProductsClient productClient,
    required Product? product,
  })  : _productsClient = productClient,
        super(ProductState(product: product));

  final ProductsClient _productsClient;
}
