import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/data/model/view_user.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatefulWidget] for updating the [ViewUser] image.
///
/// #### Parameters:
/// - [onTap] : Callback to retrieve the [XFile] image chose by the user.
/// - [currentProfileImage] : The current profile image.
class UpdateProfileImage extends StatefulWidget {
  const UpdateProfileImage(
      {super.key, required this.currentProfileImage, required this.onTap});

  final String currentProfileImage;
  final XFileCallback onTap;

  @override
  State<UpdateProfileImage> createState() => _UpdateProfileImageState();
}

class _UpdateProfileImageState extends State<UpdateProfileImage> {
  XFile? _image;
  late ImagePicker _imagePicker;
  late String _currentPhotoUrl;

  @override
  void initState() {
    super.initState();
    _currentPhotoUrl = widget.currentProfileImage;
    _imagePicker = ImagePicker();
  }

  /// Opens the gallery to pick an image.
  Future<void> _pickImage(ImagePicker imagePicker) async {
    XFile? file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (file != null) {
      setState(() {
        _image = file;
      });
    } else {
      setState(() {
        _image = null;
      });
    }
    widget.onTap(_image);
  }

  @override
  Widget build(BuildContext context) {
    return OpacityButton(
      onClick: () async {
        await _pickImage(_imagePicker);
      },
      child: _image != null
          ? SizedBox(
              width: 80.r,
              height: 80.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(80.r / 2),
                child: Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : CircleAvatar(
              radius: 40.r,
              backgroundImage: _currentPhotoUrl != ''
                  ? NetworkImage(_currentPhotoUrl)
                  : null,
              child: _currentPhotoUrl == ''
                  ? SvgPicture.asset(
                      UiConstants.profileAssetPath,
                      semanticsLabel: "Profile Icon",
                      height: 30.r,
                      width: 30.r,
                    )
                  : null,
            ),
    );
  }
}
