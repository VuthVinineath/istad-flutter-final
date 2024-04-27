import 'package:ecommerce_clothes/res/app_url.dart';
import 'package:ecommerce_clothes/views/home/models/product_request.dart';
import '../../../data/network/api_service.dart';
import '../models/products.dart';

class ProductsRepository{
  var apiService = ApiService();

  // Mark : Get E-commerce Product
  Future<Products> getAllProducts() async{
    try{
      dynamic response = await apiService.getApi(AppUrl.getAllProduct);
      return productsFromJson(response);
    }catch(exception){
      rethrow;
    }
  }
  Future<bool> postProduct(data) async{
    var productRequest = productsRequestToJson(data);
    dynamic response = await apiService.postProducts(AppUrl.postProduct, productRequest);
    return response;
  }
}