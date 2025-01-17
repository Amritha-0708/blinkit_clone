part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class ClearCartEvent extends CartEvent {}

class AddProductToCartEvent extends CartEvent {
  final ProductDetails product;
  const AddProductToCartEvent(this.product);
  @override
  List<Object> get props => [product];
}

class RemoveProductFromCartEvent extends CartEvent {
  final ProductDetails product;
  const RemoveProductFromCartEvent(this.product);
  @override
  List<Object> get props => [product];
}

class UpdateIncrementProductInCartEvent extends CartEvent {
  final ProductDetails product;
  const UpdateIncrementProductInCartEvent(this.product);
  @override
  List<Object> get props => [product];
}

class UpdateDecrementProductInCartEvent extends CartEvent {
  final ProductDetails product;
  const UpdateDecrementProductInCartEvent(this.product);
  @override
  List<Object> get props => [product];
}
