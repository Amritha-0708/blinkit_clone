import 'package:blinkit_clone/models/product_details.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(InitailCartState()) {
    on<AddProductToCartEvent>((AddProductToCartEvent event, Emitter emit) {
      if (state is LoadingCartState || state is EmptyCartState) {
        emit(LoadedCartState(
            cartItems: {event.product: 1},
            totalAmount: event.product.price ?? 0));
      } else if (state is LoadedCartState) {
        final currentState = state as LoadedCartState;
        final currentCartItems =
            Map<ProductDetails, double>.from(currentState.cartItems);
        final currentTotalAmount = currentState.totalAmount;
        currentCartItems[event.product] = 1;
        final newTotalAmount = currentTotalAmount + (event.product.price ?? 0);
        emit(LoadedCartState(
            cartItems: currentCartItems, totalAmount: newTotalAmount));
      } else {
        emit(ErrorCartState(message: "Couldn't Add Product"));
      }
    });
    on<RemoveProductFromCartEvent>(
        (RemoveProductFromCartEvent event, Emitter emit) {
      if (state is LoadedCartState) {
        final currentState = state as LoadedCartState;
        final currentCartItems =
            Map<ProductDetails, double>.from(currentState.cartItems);
        final currentTotalAmount = currentState.totalAmount;
        currentCartItems.remove(event.product);
        final newTotalAmount = currentTotalAmount + (event.product.price ?? 0);
        if (currentCartItems.isNotEmpty) {
          emit(LoadedCartState(
              cartItems: currentCartItems, totalAmount: newTotalAmount));
        } else {
          emit(EmptyCartState());
        }
      } else {
        emit(ErrorCartState(message: "Couldn't Remove Product"));
      }
    });
    on<UpdateIncrementProductInCartEvent>(
        (UpdateIncrementProductInCartEvent event, Emitter emit) {
      if (state is LoadedCartState) {
        final currentState = state as LoadedCartState;
        final currentCartItems =
            Map<ProductDetails, double>.from(currentState.cartItems);
        final currentTotalAmount = currentState.totalAmount;
        if (currentCartItems.containsKey(event.product)) {
          currentCartItems[event.product] =
              currentCartItems[event.product]! + 1;
          final newTotalAmount =
              currentTotalAmount + (event.product.price ?? 0);
          emit(LoadedCartState(
            cartItems: currentCartItems,
            totalAmount: newTotalAmount,
          ));
        } else {
          add(AddProductToCartEvent(event.product));
        }
      } else {
        emit(ErrorCartState(message: "Couldn't update product quantity"));
      }
    });
    on<UpdateDecrementProductInCartEvent>(
      (UpdateDecrementProductInCartEvent event, Emitter emit) {
        if (state is LoadedCartState) {
          final currentState = state as LoadedCartState;
          final currentCartItems =
              Map<ProductDetails, double>.from(currentState.cartItems);
          final currentTotalAmount = currentState.totalAmount;

          if (currentCartItems.containsKey(event.product)) {
            if (currentCartItems[event.product]! > 1) {
              currentCartItems[event.product] =
                  currentCartItems[event.product]! - 1;
              final newTotalAmount =
                  currentTotalAmount - (event.product.price ?? 0);
              emit(LoadedCartState(
                cartItems: currentCartItems,
                totalAmount: newTotalAmount,
              ));
            } else {
              currentCartItems.remove(event.product);
              final newTotalAmount =
                  currentTotalAmount - (event.product.price ?? 0);
              if (currentCartItems.isNotEmpty) {
                emit(LoadedCartState(
                  cartItems: currentCartItems,
                  totalAmount: newTotalAmount,
                ));
              } else {
                emit(EmptyCartState());
              }
            }
          } else {
            emit(ErrorCartState(message: "Product not found in cart"));
          }
        } else {
          emit(ErrorCartState(message: "Couldn't update product quantity"));
        }
      },
    );
    on<ClearCartEvent>((ClearCartEvent event, Emitter emit) {
      if (state is LoadedCartState) {
        emit(EmptyCartState());
      } else {
        emit(ErrorCartState(
            message: "Cart is already empty or in an invalid state"));
      }
    });
  }
}
