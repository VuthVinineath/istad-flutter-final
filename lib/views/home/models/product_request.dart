// To parse this JSON data, do
//
//     final productsRequest = productsRequestFromJson(jsonString);

import 'dart:convert';

ProductsRequest productsRequestFromJson(String str) => ProductsRequest.fromJson(json.decode(str));

String productsRequestToJson(ProductsRequest data) => json.encode(data.toJson());

class ProductsRequest {
  Data? data;

  ProductsRequest({
    this.data,
  });

  factory ProductsRequest.fromJson(Map<String, dynamic> json) => ProductsRequest(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  String? title;
  String? description;
  String? price;
  String? thumbnail;

  Data({
    this.title,
    this.description,
    this.price,
    this.thumbnail,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    price: json["price"],
    thumbnail: json["thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "price": price,
    "thumbnail": thumbnail,
  };
}
