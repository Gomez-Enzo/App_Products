part of 'home_cubit.dart';

enum HomeStatus {
  loading,
  success,
  failure,
}

class HomeState extends Equatable {
  const HomeState({
    this.products = const [],
    this.status = HomeStatus.loading,
  });

  final HomeStatus status;
  final List<Product> products;

  bool get isLoading => status == HomeStatus.loading;
  bool get isSuccess => status == HomeStatus.success;
  bool get isFailure => status == HomeStatus.failure;

  HomeState copyWith({
    List<Product>? products,
    HomeStatus? status,
  }) {
    return HomeState(
      products: products ?? this.products,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
        products,
        status,
      ];
}
