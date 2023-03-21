import 'dart:async';

import 'package:celenganku_app_clone/shared/shared.dart';

part 'fake_data.dart';

class FakeWishDataApi extends WishApi {
  const FakeWishDataApi({required FakeWishList fakeWishList}) : _fakeWishList = fakeWishList;

  final FakeWishList _fakeWishList;

  @override
  List<Wish> getWishList() {
    return _fakeWishList.fakeWishList;
  }

  @override
  Future<void> saveWish(Wish wish) async {
    int index = _fakeWishList.fakeWishList.indexWhere((e) => e.id == wish.id);
    bool isNew = index == -1;

    if (isNew) {
      _fakeWishList.fakeWishList.add(wish);
    } else {
      _fakeWishList.fakeWishList.replaceRange(index, index + 1, [wish]);
    }
  }

  @override
  Future<void> deleteWish(String id) async {
    _fakeWishList.fakeWishList.removeWhere((e) => e.id == id);
  }

  @override
  Future<void> addSaving(String id, Saving saving) async {
    _fakeWishList.fakeWishList.firstWhere((e) => e.id == id).listSaving.add(saving);
  }

  @override
  List<Object?> get props => [_fakeWishList];
}
