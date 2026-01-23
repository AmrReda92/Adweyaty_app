part of 'wallet_cubit.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}
class WalletLoading extends WalletState {}

class WalletSuccess extends WalletState {}

class WalletError extends WalletState {
  final String message;
  WalletError(this.message);
}