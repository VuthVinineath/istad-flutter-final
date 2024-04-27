import 'package:flutter/widgets.dart';

import '../../../data/response/api_response.dart';
import '../repository/image_repo.dart';

class ImageViewModels extends ChangeNotifier {
  final _imageRepo = ImageRepository();
  ApiResponse<dynamic> response = ApiResponse();

  setImageData(response){
    this.response = response;
    notifyListeners();
  }

  Future<dynamic> uploadImage(image) async {
    setImageData(ApiResponse.loading());
    await _imageRepo.uploadImage(image)
        .then((imageList) => setImageData(ApiResponse.completed(imageList)))
        .onError((error, stackTrace) => setImageData(ApiResponse.error(stackTrace.toString())));
  }
}
