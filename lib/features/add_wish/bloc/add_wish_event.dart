part of 'add_wish_bloc.dart';

abstract class AddWishEvent extends Equatable {
  const AddWishEvent();

  @override
  List<Object> get props => [];
}

class SaveWishEvent extends AddWishEvent {
  const SaveWishEvent({required this.wish});

  final Wish wish;

  @override
  List<Object> get props => [wish];
}
