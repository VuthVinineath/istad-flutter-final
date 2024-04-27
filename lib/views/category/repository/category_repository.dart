import 'package:ecommerce_clothes/data/network/api_service.dart';
import 'package:ecommerce_clothes/views/category/models/category.dart';

import '../../../res/app_url.dart';

class CategoryRepository{
  var apiService = ApiService();

  // Mark : Get E-commerce Product
  Future<Category> getAllCategory() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllProduct);
      return categoryFromJson(response);
    }catch(exception){
      rethrow;
    }
  }
}