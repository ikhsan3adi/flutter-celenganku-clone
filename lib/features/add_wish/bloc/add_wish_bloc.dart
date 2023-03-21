import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_wish_event.dart';
part 'add_wish_state.dart';

class AddWishBloc extends Bloc<AddWishEvent, AddWishState> {
  AddWishBloc({required WishRepository wishRepository})
      : _wishRepository = wishRepository,
        super(const AddWishState()) {
    on<SaveWishEvent>(_saveWish);
  }

  final WishRepository _wishRepository;

  Future<void> _saveWish(SaveWishEvent event, Emitter<AddWishState> emit) async {}
}
