part of 'on_going_bloc.dart';

abstract class OnGoingEvent extends Equatable {
  const OnGoingEvent();

  @override
  List<Object> get props => [];
}

class FetchWishEvent extends OnGoingEvent {}
