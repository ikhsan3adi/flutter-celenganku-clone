part of 'achieved_detail_cubit.dart';

class AchievedDetailState extends Equatable {
  const AchievedDetailState({required this.wish});

  final Wish wish;

  AchievedDetailState copyWith({Wish? wish}) {
    return AchievedDetailState(wish: wish ?? this.wish);
  }

  @override
  List<Object> get props => [wish];
}
