part of 'add_wish_bloc.dart';

class AddWishState extends Equatable {
  const AddWishState({
    required this.newWish,
    this.isNameValid = true,
    this.isSavingTargetValid = true,
    this.isSavingNominalValid = true,
  });

  final Wish newWish;

  final bool isNameValid;
  final bool isSavingTargetValid;
  final bool isSavingNominalValid;

  AddWishState copyWith({
    Wish? newWish,
    bool? isNameValid,
    bool? isSavingTargetValid,
    bool? isSavingNominalValid,
  }) {
    return AddWishState(
      newWish: newWish ?? this.newWish,
      isNameValid: isNameValid ?? this.isNameValid,
      isSavingTargetValid: isSavingTargetValid ?? this.isSavingTargetValid,
      isSavingNominalValid: isSavingNominalValid ?? this.isSavingNominalValid,
    );
  }

  @override
  List<Object> get props => [newWish, isNameValid, isSavingTargetValid, isSavingNominalValid];
}
