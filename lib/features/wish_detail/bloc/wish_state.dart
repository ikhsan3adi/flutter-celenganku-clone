part of 'wish_bloc.dart';

class WishState extends Equatable {
  const WishState({required this.wish});

  final Wish wish;

  WishState copyWith({Wish? wish}) {
    return WishState(wish: wish ?? this.wish);
  }

  @override
  List<Object> get props => [wish];
}
