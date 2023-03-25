import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

part 'add_wish_event.dart';
part 'add_wish_state.dart';

class AddWishBloc extends Bloc<AddWishEvent, AddWishState> {
  AddWishBloc({required WishRepository wishRepository, required Wish newWish})
      : _wishRepository = wishRepository,
        super(AddWishState(newWish: newWish)) {
    on<WishImageChanged>(_wishImageChanged);
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

  void _wishImageChanged(WishImageChanged event, Emitter<AddWishState> emit) {
    emit(state.copyWith(newWish: state.newWish.copyWith(imagePath: event.imagePath)));
  }

  void _wishNameChanged(WishNameChanged event, Emitter<AddWishState> emit) {
    emit(state.copyWith(newWish: state.newWish.copyWith(name: event.wishName)));
  }

  void _wishSavingTargetChanged(WishSavingTargetChanged event, Emitter<AddWishState> emit) {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingTarget: event.savingTarget)));
  }

  void _wishSavingPlanChanged(WishSavingPlanChanged event, Emitter<AddWishState> emit) {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingPlan: event.savingPlan)));
  }

  void _wishSavingNominalChanged(WishSavingNominalChanged event, Emitter<AddWishState> emit) {
    emit(state.copyWith(newWish: state.newWish.copyWith(savingNominal: event.savingNominal)));
  }

  void _nameValidation(WishNameValidation event, Emitter<AddWishState> emit) {
    emit(state.copyWith(isNameValid: event.isNameValid));
  }

  void _wishTargetValidation(WishTargetValidation event, Emitter<AddWishState> emit) {
    emit(state.copyWith(isSavingTargetValid: event.isSavingTargetValid));
  }

  void _wishNominalValidation(WishNominalValidation event, Emitter<AddWishState> emit) {
    emit(state.copyWith(isSavingNominalValid: event.isSavingNominalValid));
  }

  Future<void> _saveWish(SaveWishEvent event, Emitter<AddWishState> emit) async {
    Wish newWish = state.newWish.copyWith(
      id: const Uuid().v4(),
      createdAt: DateTime.now(),
    );

    await _wishRepository.saveWish(newWish);

    emit(state.copyWith(newWish: newWish));
  }
}
