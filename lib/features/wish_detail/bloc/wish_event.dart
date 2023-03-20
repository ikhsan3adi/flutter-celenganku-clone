part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable {
  const WishEvent();

  @override
  List<Object> get props => [];
}

class AddSavingEvent extends WishEvent {
  const AddSavingEvent({required this.saving});

  final Saving saving;

  @override
  List<Object> get props => [saving];
}

class TakeSavingEvent extends WishEvent {
  const TakeSavingEvent({required this.saving});

  final Saving saving;

  @override
  List<Object> get props => [saving];
}

class DeleteWishEvent extends WishEvent {}
