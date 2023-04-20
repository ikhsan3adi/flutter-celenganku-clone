part of 'on_going_bloc.dart';

class OnGoingState extends Equatable {
  const OnGoingState({this.wishList = const <Wish>[]});

  final List<Wish> wishList;

  OnGoingState copyWith({List<Wish>? wishList}) {
    return OnGoingState(wishList: wishList ?? this.wishList);
  }

  @override
  List<Object> get props => [wishList];
}

class OnGoingLoadingState extends OnGoingState {
  const OnGoingLoadingState({super.wishList});
}

class OnGoingLoadedState extends OnGoingState {
  const OnGoingLoadedState({super.wishList});
}
