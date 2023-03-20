import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'on_going_event.dart';
part 'on_going_state.dart';

class OnGoingBloc extends Bloc<OnGoingEvent, OnGoingState> {
  OnGoingBloc() : super(const OnGoingState()) {
    on<FetchWishEvent>(_fetchWishList);
  }

  Future<void> _fetchWishList(FetchWishEvent event, Emitter<OnGoingState> emit) async {}
}
