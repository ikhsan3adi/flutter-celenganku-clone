import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wish_event.dart';
part 'wish_state.dart';

class WishBloc extends Bloc<WishEvent, WishState> {
  WishBloc({required Wish wish})
      : _wish = wish,
        super(WishState(wish: wish)) {
    on<AddSavingEvent>(_addSaving);
    on<TakeSavingEvent>(_takeSaving);
  }

  final Wish _wish;

  Future<void> _addSaving(AddSavingEvent event, Emitter<WishState> emit) async {
    _wish.copyWith(
      listSaving: [..._wish.listSaving, event.saving],
    );
  }

  Future<void> _takeSaving(TakeSavingEvent event, Emitter<WishState> emit) async {
    Saving newSaving = event.saving.copyWith(
      savingNominal: event.saving.savingNominal * -1,
    );

    _wish.copyWith(
      listSaving: [..._wish.listSaving, newSaving],
    );
  }
}
