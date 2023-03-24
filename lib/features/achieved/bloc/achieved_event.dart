part of 'achieved_bloc.dart';

abstract class AchievedEvent extends Equatable {
  const AchievedEvent();

  @override
  List<Object> get props => [];
}

class FetchAchievedWishEvent extends AchievedEvent {}
