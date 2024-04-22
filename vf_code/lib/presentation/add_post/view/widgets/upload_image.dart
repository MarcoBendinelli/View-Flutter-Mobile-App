import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:view_app/core/utils.dart';
import 'package:view_app/presentation/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:view_app/presentation/widgets/widgets.dart';

/// [StatefulWidget] for uploading the [ViewPost] thumbnail image.
///
/// #### Parameters:
/// - [onTap] : Callback to retrieve the [XFile] image chose by the user.
class UploadImage extends StatefulWidget {
  const UploadImage({super.key, required this.onTap});

  final XFileCallback onTap;

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  XFile? _image;
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
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
      child: Container(
        height: _image == null ? 100.h : 170.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: 1.0, // Set the border width
          ),
        ),
        child: _image == null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    UiConstants.thumbImageAssetPath,
                    width: 20.w,
                    semanticsLabel: "Thumb Image Icon",
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    AppLocalizations.of(context)!.upload_image,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontsWeight.semiBold,
                        color: Theme.of(context).colorScheme.secondary),
                  )
                ],
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.file(
                  File(_image!.path),
                  fit: BoxFit.cover,
                ),
              ),
      ),
    );
  }
}
