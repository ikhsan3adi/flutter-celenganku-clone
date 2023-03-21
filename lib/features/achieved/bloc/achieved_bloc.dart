import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'achieved_event.dart';
part 'achieved_state.dart';

class AchievedBloc extends Bloc<AchievedEvent, AchievedState> {
  AchievedBloc({required WishRepository wishRepository})
      : _wishRepository = wishRepository,
        super(const AchievedState()) {
    on<AchievedEvent>((event, emit) {});
  }
  final WishRepository _wishRepository;
}
