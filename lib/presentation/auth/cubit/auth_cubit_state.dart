part of 'auth_cubit.dart';

sealed class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object> get props => [];
}

final class AuthCubitInitial extends AuthCubitState {}

final class AuthCubitLoading extends AuthCubitState {
  final String message;

  const AuthCubitLoading({required this.message});
}

final class AuthCubitSuccess extends AuthCubitState {
  final String message;

  AuthCubitSuccess({required this.message}) {
    GeneralWidgets.toast(message);
  }
}

final class AuthCubitFailure extends AuthCubitState {
  final String message;

  const AuthCubitFailure({required this.message});
}
