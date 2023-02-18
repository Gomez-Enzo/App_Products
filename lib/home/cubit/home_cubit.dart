import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_client/products_client.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required ProductsClient productsClient,
  })  : _productsClient = productsClient,
        super(const HomeState());

  final ProductsClient _productsClient;

  Future<void> getProducts() async {
    try {
      final products = await _productsClient.getProducts();
      if (products != null) {
        return emit(
          state.copyWith(
            products: products,
            status: HomeStatus.success,
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(status: HomeStatus.failure),
      );
    }
  }
}
