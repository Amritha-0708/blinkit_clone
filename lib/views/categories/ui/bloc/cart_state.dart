part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

class InitailCartState extends CartState {}

class EmptyCartState extends CartState {}

class LoadedCartState extends CartState {
  final Map<ProductDetails, double> cartItems;
  final double totalAmount;

  const LoadedCartState({required this.cartItems, required this.totalAmount});

  @override
  List<Object> get props => [cartItems, totalAmount];
}

class ErrorCartState extends CartState {
  final String message;

  const ErrorCartState({required this.message});

  @override
  List<Object> get props => [message];
}
