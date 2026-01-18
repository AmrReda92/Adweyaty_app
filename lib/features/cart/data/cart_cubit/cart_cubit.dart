import 'package:adweyaty_application/features/cart/data/models/cart_item_model.dart';
import 'package:adweyaty_application/features/cart/data/repo/cart_repo.dart';
import 'package:adweyaty_application/features/home/data/cubit/home_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  final HomeCubit homeCubit;
  CartCubit(this.cartRepo, this.homeCubit) : super(CartInitial());

  String get uid {
    final state = homeCubit.state;
    if(state is HomeDataSuccess){
      return state.user.uid;
    }else{
      throw ("user is not logged in");
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
}
