part of 'product_cubit.dart';

enum ProductStatus {
  loading,
  success,
  failure,
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.loading,
  });

  final ProductStatus status;

  bool get isLoading => status == ProductStatus.loading;
  bool get isSuccess => status == ProductStatus.success;
  bool get isFailure => status == ProductStatus.failure;

  ProductState copyWith({
    Product? product,
    ProductStatus? status,
  }) {
    return ProductState(
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        status,
      ];
}
