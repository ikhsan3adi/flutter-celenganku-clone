part of 'achieved_bloc.dart';

class AchievedState extends Equatable {
  const AchievedState({this.wishList = const <Wish>[]});

  final List<Wish> wishList;

  AchievedState copyWith({List<Wish>? wishList}) {
    return AchievedState(wishList: wishList ?? this.wishList);
  }

  @override
  List<Object> get props => [wishList];
}

class AchievedLoadingState extends AchievedState {}
