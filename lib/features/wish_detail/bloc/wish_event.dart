part of 'wish_bloc.dart';

abstract class WishEvent extends Equatable {
  const WishEvent();

  @override
  List<Object> get props => [];
}

class SavingNominalChanged extends WishEvent {
  SavingNominalChanged({required dynamic value}) {
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

class SavingMessageChanged extends WishEvent {
  const SavingMessageChanged({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class SavingNominalValidation extends WishEvent {
  const SavingNominalValidation({required this.isSavingNominalValid});

  final bool isSavingNominalValid;

  @override
  List<Object> get props => [isSavingNominalValid];
}

class AddSavingEvent extends WishEvent {
  const AddSavingEvent();
}

class TakeSavingEvent extends WishEvent {
  const TakeSavingEvent();
}

class DeleteWishEvent extends WishEvent {}
