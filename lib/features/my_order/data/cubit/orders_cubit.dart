import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/order_model.dart';
import '../repo/order_repo.dart';

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final OrdersRepo repo;

  OrdersCubit(this.repo) : super(OrdersInitial());

  String get uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw "User not logged in";
    return user.uid;
  }

  Future<void> createOrder(OrderModel order) async {
    try {
      emit(OrdersLoading());
      await repo.createOrder(uid: uid, order: order);
      emit(OrdersSuccess());
    } catch (e) {
      emit(OrdersError(e.toString()));
    }
  }

  Stream<List<OrderModel>> getOrders() {
    return repo.getOrders(uid);
  }
}
