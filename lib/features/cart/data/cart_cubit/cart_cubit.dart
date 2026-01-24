import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:adweyaty_application/features/cart/data/repo/cart_repo.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo,) : super(CartInitial());

  String get uid {
    final user = FirebaseAuth.instance.currentUser;
    if(user == null){
      throw ("user is not logged in");
    }else{
      return user.uid;
    }
  }

  Future<void> addToCart(CartItemModel item)async{
    try {
      emit(CartLoading());
      await cartRepo.AddToCart(uid: uid, item: item);
      emit(CartSuccess());
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }
  Stream<List<CartItemModel>> getCartItems(){
    return cartRepo.getCartItems(uid);
  }
  Future<void> increaseQuantity(CartItemModel item) async {
    try {
      await cartRepo.updateQuantity(
        uid: uid,
        productId: item.productId,
        quantity: item.quantity + 1,
      );
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> decreaseQuantity(CartItemModel item) async {
    try {
      if (item.quantity <= 1) {
        await cartRepo.removeFromCart(
          uid: uid,
          productId: item.productId,
        );
      } else {
        await cartRepo.updateQuantity(
          uid: uid,
          productId: item.productId,
          quantity: item.quantity - 1,
        );
      }
    } catch (e) {
      emit(CartError(e.toString()));
    }
  }

  Future<void> clearCart()async{
    try{
      emit(CartLoading());
      await cartRepo.clearFromCart(uid);
      emit(CartSuccess());
    }catch(e){
      emit(CartError(e.toString()));
    }
  }
}
