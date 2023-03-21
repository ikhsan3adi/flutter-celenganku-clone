import 'package:celenganku_app_clone/shared/model/model.dart';
import 'package:equatable/equatable.dart';

abstract class WishApi extends Equatable {
  const WishApi();

  List<Wish> getWishList();

  Future<void> saveWish(Wish wish);

  Future<void> deleteWish(String id);

  Future<void> addSaving(String id, Saving saving);
}
