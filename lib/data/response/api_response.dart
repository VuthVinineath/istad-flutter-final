import 'package:ecommerce_clothes/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  // Mark : Constructor for general response
  ApiResponse({this.status,this.data,this.message});
  // Mark : Constructor for loading state
  ApiResponse.loading(): status = Status.LOADING;
  // Mark : Constructor for complete state
  ApiResponse.completed(this.data):status = Status.COMPLETE;
  // Mark : Constructor for error state
  ApiResponse.error(this.message):status = Status.ERROR;

  @override
  String toString() {
    return 'ApiResponse{status: $status, data: $data, message: $message}';
  }
}