

import '../ExportFile/Export.dart';

class imagepicker {

  /*=================================================================== Image Pick Using camera ===================================================*/

  Future<PickedFile?> imageFromCamera() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 100);
    if (pickedFile == null) {
      BaseClass.baseclass.showErrorToast("strNoImageClicked");

    } else {
      return cropImage(pickedFile.path);
    }
    return null;
  }

/*=================================================================== Image Pick Using Gallery ===================================================*/

  Future<PickedFile?> imageFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 100);
    if (pickedFile == null) {
       BaseClass.baseclass.showErrorToast("strNoImageClicked");
    } else {
      return cropImage(pickedFile.path);
    }
    return null;
  }

  Future<PickedFile?> cropImage(filePath) async {
    var croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.original
      ],
    );
    if (croppedImage == null) {
     BaseClass.baseclass.showErrorToast("strNoImageClicked");
    } else {
      return PickedFile(croppedImage.path);
    }
    return null;
  }
}
