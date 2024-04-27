import 'package:ecommerce_clothes/data/response/api_response.dart';
import 'package:ecommerce_clothes/views/home/repository/product_repository.dart';
import 'package:flutter/material.dart';

import '../models/products.dart';

class ProductsViewModel extends ChangeNotifier{
  var _productRepo = ProductsRepository();
  ApiResponse<Products> response = ApiResponse();

  setProductList(response){
    this.response = response;
    notifyListeners();
  }

  // Mark : Fetch ALL Ecomerce Product
  Future<dynamic> getAllProducts() async{
    await _productRepo.getAllProducts()
        .then((product)=>setProductList(ApiResponse.completed(product)))
        .onError((error, stackTrace) => ApiResponse.error(stackTrace.toString()));
  }
}