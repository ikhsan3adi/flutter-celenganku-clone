part of 'wish_bloc.dart';

class WishState extends Equatable {
  const WishState({
    required this.wish,
    required this.newSaving,
    this.isSavingNominalValid = true,
  });

  final Wish wish;

  final Saving newSaving;

  final bool isSavingNominalValid;

  WishState copyWith({Wish? wish, Saving? newSaving, bool? isSavingNominalValid}) {
    return WishState(
      wish: wish ?? this.wish,
      newSaving: newSaving ?? this.newSaving,
      isSavingNominalValid: isSavingNominalValid ?? this.isSavingNominalValid,
    );
  }

  @override
  List<Object> get props => [wish, newSaving, isSavingNominalValid];
}
