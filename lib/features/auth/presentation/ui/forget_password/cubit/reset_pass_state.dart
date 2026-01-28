
import 'package:flutter/foundation.dart';

@immutable
sealed class ResetPassState {}

final class ResetPassInitial extends ResetPassState {}

final class ResetPassLoading extends ResetPassState {}
final class ResetPassSuccess extends ResetPassState {}
final class ResetPassError extends ResetPassState {
  final String message ;
  ResetPassError(this.message);
}

