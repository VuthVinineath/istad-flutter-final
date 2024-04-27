import 'package:ecommerce_clothes/data/response/api_response.dart';
import 'package:ecommerce_clothes/views/home/repository/product_repository.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

class ProductsRequestViewModel extends ChangeNotifier{
  var _productRepo = ProductsRepository();
  var response = ApiResponse();

  setProductData(response){
    this.response = response;
    notifyListeners();
  }

  // Mark : post ALL Ecomerce Product
  Future<dynamic> postProduct(data, {isUpdate, id}) async {
    setProductData(ApiResponse.loading());
    await _productRepo
        .postProduct(data)
        .then((isPosted) => setProductData(ApiResponse.completed(isPosted)))
        .onError((error, stackTrace) =>
        setProductData(ApiResponse.error(stackTrace.toString())));
  }
}