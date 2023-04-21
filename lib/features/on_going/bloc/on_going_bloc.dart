import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'on_going_event.dart';
part 'on_going_state.dart';

class OnGoingBloc extends Bloc<OnGoingEvent, OnGoingState> {
  OnGoingBloc({required WishRepository wishRepository})
      : _wishRepository = wishRepository,
        super(const OnGoingState()) {
    on<FetchWishEvent>(_fetchWishList);
  }

  final WishRepository _wishRepository;

  Future<void> _fetchWishList(FetchWishEvent event, Emitter<OnGoingState> emit) async {
    emit(OnGoingLoadingState(wishList: state.wishList));

    await Future.delayed(
      const Duration(milliseconds: 500),
      () => emit(OnGoingLoadedState(wishList: _wishRepository.getOnGoingWishList())),
    );
  }
}
