import 'dart:math';

import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_wish_event.dart';
part 'add_wish_state.dart';

class AddWishBloc extends Bloc<AddWishEvent, AddWishState> {
  AddWishBloc({required WishRepository wishRepository, required Wish newWish})
      : _wishRepository = wishRepository,
        super(AddWishState(newWish: newWish)) {
    on<WishNameChanged>(_wishNameChanged);
    on<WishSavingTargetChanged>(_wishSavingTargetChanged);
    on<WishSavingPlanChanged>(_wishSavingPlanChanged);
    on<WishSavingNominalChanged>(_wishSavingNominalChanged);
    on<SaveWishEvent>(_saveWish);
    on<WishNameValidation>(_nameValidation);
    on<WishTargetValidation>(_wishTargetValidation);
    on<WishNominalValidation>(_wishNominalValidation);
  }

  final WishRepository _wishRepository;

  Future<void> _wishNameChanged(WishNameChanged event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(newWish: state.newWish.copyWith(name: event.wishName)));
  }

  Future<void> _wishSavingTargetChanged(WishSavingTargetChanged event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingTarget: event.savingTarget)));
  }

  Future<void> _wishSavingPlanChanged(WishSavingPlanChanged event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingPlan: event.savingPlan)));
  }

  Future<void> _wishSavingNominalChanged(WishSavingNominalChanged event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingNominal: event.savingNominal)));
  }

  Future<void> _nameValidation(WishNameValidation event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(isNameValid: event.isNameValid));
  }

  Future<void> _wishTargetValidation(WishTargetValidation event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(isSavingTargetValid: event.isSavingTargetValid));
  }

  Future<void> _wishNominalValidation(WishNominalValidation event, Emitter<AddWishState> emit) async {
    emit(state.copyWith(isSavingNominalValid: event.isSavingNominalValid));
  }

  void _saveWish(SaveWishEvent event, Emitter<AddWishState> emit) async {
    Wish newWish = state.newWish.copyWith(
      id: Random.secure().nextInt(1000).toStringAsExponential(), // will replace by uuid
      createdAt: DateTime.now(),
    );

    await _wishRepository.saveWish(newWish);
  }
}
