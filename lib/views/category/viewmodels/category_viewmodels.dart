import 'package:ecommerce_clothes/views/category/models/category.dart';
import 'package:ecommerce_clothes/views/category/repository/category_repository.dart';
import 'package:flutter/material.dart';

import '../../../data/response/api_response.dart';

class CategoryViewModel extends ChangeNotifier{
  var _categoryRepo = CategoryRepository();
  ApiResponse<Category> response = ApiResponse();

  setCategoryList(response){
    this.response = response;
    notifyListeners();
  }

  // Mark : Fetch ALL Ecomerce Product
  Future<dynamic> getAllProducts() async{
    await _categoryRepo.getAllCategory()
        .then((category)=>setCategoryList(ApiResponse.completed(category)))
        .onError((error, stackTrace) => ApiResponse.error(stackTrace.toString()));
  }
}