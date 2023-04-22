import 'dart:io';

import 'package:celenganku_app_clone/features/add_wish/add_wish.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart' as cropper;
import 'package:image_picker/image_picker.dart' as picker;

class ImagePicker extends StatelessWidget {
  const ImagePicker({super.key});

  /// Get from camera
  Future<String?> _getFromCamera() async {
    picker.ImagePicker imagePicker = picker.ImagePicker();

    picker.XFile? image = await imagePicker.pickImage(source: picker.ImageSource.camera);

    if (image != null) {
      return await _cropImage(filePath: image.path);
    }
    return null;
  }

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
                  color: imagePath != null ? Colors.transparent : theme.colorScheme.surfaceVariant,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () async {
                      await showModalBottomSheet<void>(
                        context: context,
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
                        builder: (_) => _selectImageSourceModal(context),
                      );
                    },
                    child: imagePath != null
                        ? null
                        : Center(
                            child: Icon(
                              Icons.add_photo_alternate_outlined,
                              size: 100,
                              color: theme.colorScheme.primary,
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

  Widget _selectImageSourceModal(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Pilih Sumber Gambar",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          _ImageSourceListTile(
            titleText: 'Kamera',
            iconData: Icons.camera_alt_outlined,
            onTap: () async {
              String? path = await _getFromCamera();

              if (path == null) return;

              if (context.mounted) {
                context.read<AddWishBloc>().add(WishImageChanged(imagePath: path));
                Navigator.pop(context);
              }
            },
          ),
          _ImageSourceListTile(
            titleText: 'Gallery',
            iconData: Icons.photo_library_outlined,
            onTap: () async {
              String? path = await _getFromGallery();

              if (path == null) return;

              if (context.mounted) {
                context.read<AddWishBloc>().add(WishImageChanged(imagePath: path));
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}

class _ImageSourceListTile extends StatelessWidget {
  const _ImageSourceListTile({
    required this.titleText,
    required this.iconData,
    required this.onTap,
  });

  final String titleText;
  final IconData iconData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: theme.colorScheme.onPrimary,
        child: Icon(iconData),
      ),
      title: Text(titleText, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: onTap,
    );
  }
}
