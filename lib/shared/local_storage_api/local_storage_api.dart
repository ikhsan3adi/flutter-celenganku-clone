import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageApi extends WishApi {
  const LocalStorageApi({required Box box}) : _box = box;

  final Box _box;

  static const String keyName = '__celengan__';

  @override
  List<Wish> getWishList() {
    return _box.values.toList() as List<Wish>;
  }

  @override
  Future<void> saveWish(Wish wish) async {
    return await _box.put(wish.id, wish);
  }

  @override
  Future<void> deleteWish(String id) async {
    return await _box.delete(id);
  }

  @override
  Future<void> addSaving(String id, Saving saving) async {
    Wish wish = _box.get(id) as Wish;

    wish.copyWith(listSaving: [...wish.listSaving, saving]);

    return await _box.put(id, wish);
  }

  @override
  List<Object?> get props => [_box, keyName];
}
