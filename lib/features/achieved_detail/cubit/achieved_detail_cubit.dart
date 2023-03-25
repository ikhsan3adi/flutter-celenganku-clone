import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'achieved_detail_state.dart';

class AchievedDetailCubit extends Cubit<AchievedDetailState> {
  AchievedDetailCubit({required Wish wish, required WishRepository wishRepository})
      : _wishRepository = wishRepository,
        super(AchievedDetailState(wish: wish));

  final WishRepository _wishRepository;

  Future<void> deleteAchievedWish() async {
    await _wishRepository.deleteWish(state.wish);
  }
}
