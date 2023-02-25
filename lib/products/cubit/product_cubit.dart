import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:products_client/products_client.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({
    required ProductsClient productClient,
  })  : _productsClient = productClient,
        super(const ProductState());

  final ProductsClient _productsClient;

  Future<void> saveOrCreateProduct(Product product) async {
    if (product.id == null) {
      try {
        final id = await _productsClient.createProduct(product);
        if (id != null) {
          emit(
            state.copyWith(
              status: ProductStatus.success,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: ProductStatus.failure,
          ),
        );
      }
    } else {
      try {
        final id = await _productsClient.updateProduct(product);
        if (id != null) {
          emit(
            state.copyWith(
              status: ProductStatus.success,
            ),
          );
        }
      } catch (e) {
        emit(
          state.copyWith(
            status: ProductStatus.failure,
          ),
        );
      }
    }
  }
}
