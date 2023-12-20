part of 'auth_state_cubit.dart';

abstract class AuthState {}

class AuthStateInitial extends AuthState {}

class AuthOnBoardState extends AuthState {}

class AuthLoDInGState extends AuthState {}

class Authserver extends AuthState {}

class AuthOnBoard extends AuthState {}

class AuthGETDATA extends AuthState {}

class AuthLoginState extends AuthState {}

class AuthOtpState extends AuthState {}

class AuthResendOtpState extends AuthState {}

class AuthRegisterDetails extends AuthState {}

class AuthVerifyOtpState extends AuthState {}

class AuthAccessState extends AuthState {}

class AuthLogoutState extends AuthState {}

class AuthDeleteAccountState extends AuthState {}

class AuthErrorState extends AuthState {
  final String error;

  AuthErrorState(this.error);
}
