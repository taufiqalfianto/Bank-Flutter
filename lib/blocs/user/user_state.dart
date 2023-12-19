part of 'user_bloc.dart';

class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSucces extends UserState {
  final List<UserModel> user;
  const UserSucces(this.user);

  @override
  List<Object> get props => [user];
}

class Userfailed extends UserState {
  final String e;
  const Userfailed(this.e);

  @override
  List<Object> get props => [e];
}
