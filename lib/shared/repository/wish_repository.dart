import 'dart:io';

import 'package:celenganku_app_clone/shared/shared.dart';
import 'package:equatable/equatable.dart';
import 'package:path_provider/path_provider.dart';

class WishRepository extends Equatable {
  const WishRepository({required WishApi wishApi}) : _wishApi = wishApi;

  final WishApi _wishApi;

  List<Wish> getOnGoingWishList() {
    return _wishApi.getWishList().where((e) => e.completedAt == null).toList()..sort((a, b) => b.createdAt.compareTo(a.createdAt));
  }

  List<Wish> getAchievedWishList() {
    return _wishApi.getWishList().where((e) => e.completedAt != null).toList()..sort((a, b) => b.completedAt!.compareTo(a.completedAt!));
  }

  Future<void> saveWish(Wish wish) async {
    Wish newWish = wish.copyWith(imagePath: await _moveImageFile(wish: wish));

    await _wishApi.saveWish(newWish);
  }

  Future<void> deleteWish(Wish wish) async {
    if (wish.imagePath != null) {
      _deleteImageFile(path: wish.imagePath!);
    }

    await _wishApi.deleteWish(wish.id);
  }

  Future<void> addSaving(String id, Saving saving) async {
    await _wishApi.addSaving(id, saving);
  }

  Future<String?> _moveImageFile({required Wish wish}) async {
    String? oldImagePath = wish.imagePath;

    // move the cropped image file from cache to app directory
    if (oldImagePath != null) {
      Directory dir = await getApplicationDocumentsDirectory();

      String newDirPath = '${dir.path}/images/';

      Directory(newDirPath).createSync(recursive: true);

      String newFileName = '${wish.name.replaceAll(' ', '-')}_${wish.createdAt.toUrl()}.jpg';

      String newFilePath = '$newDirPath$newFileName';

      File newFile = File(oldImagePath).renameSync(newFilePath);

      return newFile.path;
    }
    return null;
  }

  void _deleteImageFile({required String path}) {
    File(path).deleteSync();
  }

  @override
  List<Object?> get props => [_wishApi];
}
