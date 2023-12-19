part of 'user_bloc.dart';

class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class getuserbyusername extends UserEvent {
  final String username;
  const getuserbyusername(this.username);

  @override
  List<Object> get props => [username];
}

class getuserrecent extends UserEvent {}
