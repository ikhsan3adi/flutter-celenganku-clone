part of 'add_wish_bloc.dart';

abstract class AddWishEvent extends Equatable {
  const AddWishEvent();

  @override
  List<Object> get props => [];
}

class WishImageChanged extends AddWishEvent {
  const WishImageChanged({required this.imagePath});

  final String imagePath;

  @override
  List<Object> get props => [imagePath];
}

class WishNameChanged extends AddWishEvent {
  const WishNameChanged({required this.wishName});

  final String wishName;

  @override
  List<Object> get props => [wishName];
}

class WishSavingTargetChanged extends AddWishEvent {
  WishSavingTargetChanged({required dynamic value}) {
    if ((value as String).isNotEmpty) {
      savingTarget = int.parse((value).replaceAll('.', ''));
      return;
    }
    savingTarget = 0;
  }

  late final int savingTarget;

  @override
  List<Object> get props => [savingTarget];
}

class WishSavingPlanChanged extends AddWishEvent {
  const WishSavingPlanChanged({required this.savingPlan});

  final SavingPlan savingPlan;

  @override
  List<Object> get props => [savingPlan];
}

class WishSavingNominalChanged extends AddWishEvent {
  WishSavingNominalChanged({required dynamic value}) {
    if ((value as String).isNotEmpty) {
      savingNominal = int.parse((value).replaceAll('.', ''));
      return;
    }
    savingNominal = 0;
  }

  late final int savingNominal;

  @override
  List<Object> get props => [savingNominal];
}

class SaveWishEvent extends AddWishEvent {
  const SaveWishEvent();
}

class WishNameValidation extends AddWishEvent {
  const WishNameValidation({required this.isNameValid});

  final bool isNameValid;

  @override
  List<Object> get props => [isNameValid];
}

class WishTargetValidation extends AddWishEvent {
  const WishTargetValidation({required this.isSavingTargetValid});

  final bool isSavingTargetValid;

  @override
  List<Object> get props => [isSavingTargetValid];
}

class WishNominalValidation extends AddWishEvent {
  const WishNominalValidation({
    required this.isSavingNominalValid,
  });

  final bool isSavingNominalValid;

  @override
  List<Object> get props => [isSavingNominalValid];
}
