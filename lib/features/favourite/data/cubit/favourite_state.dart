part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}

final class FavouriteLoading extends FavouriteState {}
final class FavouriteSuccess extends FavouriteState {}
class FavouriteAddedToCart extends FavouriteState {}
class FavouriteAdded extends FavouriteState {}
class FavouriteRemoved extends FavouriteState {}

final class FavouriteError extends FavouriteState {
  final String message ;
  FavouriteError(this.message);
}
