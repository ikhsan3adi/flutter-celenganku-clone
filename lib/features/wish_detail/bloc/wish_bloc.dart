import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc({required Wish wish, required Saving saving, required WishRepository wishRepository})
      : _wishRepository = wishRepository,
        super(WishState(wish: wish, newSaving: saving)) {
    on<SavingNominalChanged>(_savingNominalChanged);
    on<SavingMessageChanged>(_savingMessageChanged);
    on<SavingNominalValidation>(_savingNominalValidation);
    on<AddSavingEvent>(_addSaving);
    on<TakeSavingEvent>(_takeSaving);
    on<DeleteWishEvent>(_deleteWish);
  }

  final WishRepository _wishRepository;

  void _savingNominalChanged(SavingNominalChanged event, Emitter<WishState> emit) {
    emit(state.copyWith(newSaving: state.newSaving.copyWith(savingNominal: event.savingNominal)));
  }

  void _savingMessageChanged(SavingMessageChanged event, Emitter<WishState> emit) {
    emit(state.copyWith(newSaving: state.newSaving.copyWith(message: event.message)));
  }

  void _savingNominalValidation(SavingNominalValidation event, Emitter<WishState> emit) {
    emit(state.copyWith(isSavingNominalValid: event.isSavingNominalValid));
  }

  Future<void> _addSaving(AddSavingEvent event, Emitter<WishState> emit) async {
    Saving newSaving = state.newSaving.copyWith(createdAt: DateTime.now());

    Wish updatedWish = state.wish.copyWith(
      listSaving: [...state.wish.listSaving, newSaving],
    );

    if (updatedWish.getTotalSaving() >= updatedWish.savingTarget) {
      Wish completedWish = updatedWish.copyWith(completedAt: DateTime.now());

      emit(state.copyWith(
        wish: completedWish,
        isSavingNominalValid: true,
      ));

      await _wishRepository.saveWish(completedWish);
    } else {
      emit(state.copyWith(
        wish: updatedWish,
        isSavingNominalValid: true,
      ));

      await _wishRepository.saveWish(updatedWish);
    }
  }

  Future<void> _takeSaving(TakeSavingEvent event, Emitter<WishState> emit) async {
    Saving newSaving = state.newSaving.copyWith(
      createdAt: DateTime.now(),
      savingNominal: state.newSaving.savingNominal * -1,
    );

    Wish updatedWish = state.wish.copyWith(
      listSaving: [...state.wish.listSaving, newSaving],
    );

    await _wishRepository.saveWish(updatedWish);

    emit(state.copyWith(wish: updatedWish));
  }

  Future<void> _deleteWish(DeleteWishEvent event, Emitter<WishState> emit) async {
    await _wishRepository.deleteWish(state.wish);
  }
}
