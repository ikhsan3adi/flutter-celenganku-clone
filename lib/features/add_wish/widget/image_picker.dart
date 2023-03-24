import 'dart:io';

import 'package:celenganku_app_clone/features/add_wish/add_wish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart' as cropper;
import 'package:image_picker/image_picker.dart' as picker;

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  /// Get from gallery
  Future<String?> _getFromGallery() async {
    picker.ImagePicker imagePicker = picker.ImagePicker();

    picker.XFile? image = await imagePicker.pickImage(source: picker.ImageSource.gallery);

    if (image != null) {
      return await _cropImage(filePath: image.path);
    }
    return null;
  }

  /// Crop Image
  Future<String?> _cropImage({required filePath}) async {
    cropper.CroppedFile? croppedImage = await cropper.ImageCropper().cropImage(
      sourcePath: filePath,
      maxWidth: 1280,
      aspectRatio: const cropper.CropAspectRatio(ratioX: 16, ratioY: 9),
      uiSettings: [
        cropper.AndroidUiSettings(toolbarTitle: 'Pangkas Foto'),
        cropper.IOSUiSettings(title: 'Pangkas Foto'),
      ],
    );

    return croppedImage?.path;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: BlocBuilder<AddWishBloc, AddWishState>(
          builder: (context, state) {
            String? imagePath = state.newWish.imagePath;

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: imagePath != null
                    ? DecorationImage(
                        image: FileImage(File(imagePath)),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: SizedBox.expand(
                child: Material(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: imagePath != null ? Colors.transparent : theme.colorScheme.primary,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      String? path = await _getFromGallery();

                      if (path == null) return;

                      if (context.mounted) {
                        context.read<AddWishBloc>().add(WishImageChanged(imagePath: path));
                      }
                    },
                    child: imagePath != null
                        ? null
                        : Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 100,
                              color: theme.colorScheme.onPrimary,
                            ),
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
