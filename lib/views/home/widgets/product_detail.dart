import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:ecommerce_clothes/res/app_url.dart';
import 'package:ecommerce_clothes/views/home/models/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({this.product});
  Datum? product;
  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool isFavorite = false;
  List<int> selectedFavorite = [];
  String? title;
  String? description;
  String? price;

  @override
  void initState() {
    super.initState();
    getProductDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(
            child: Text("Details"),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print("Notification is clicked");
                },
                icon: const Icon(
                  FontAwesomeIcons.solidBell,
                  size: 20,
                ))
          ]),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MySize.marginA),
          padding: EdgeInsets.symmetric(horizontal: MySize.py),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          color: MyColors.secondary,
                          //padding: EdgeInsets.all(10),
                          child: Image.network(
                            "${AppUrl.baseUrl}${widget.product!.attributes!.thumbnail!.data!.attributes!.url!}",
                            fit: BoxFit.fill,
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.5,
                          ),
                        )),
                    Positioned(
                        right: 15,
                        top: 15,
                        child: Container(
                          decoration:
                              BoxDecoration(color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: MyColors.primary.withOpacity(0.1),
                                spreadRadius: 7,
                                blurRadius: 10,
                                offset: Offset(0, 5))
                          ]),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              icon: Icon(isFavorite == true
                                  ? FontAwesomeIcons.solidHeart
                                  : FontAwesomeIcons.heart)),
                        ))
                  ],
                ),
              ),
              Styles.hMargin,
              Text(
                "${title}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.star_border,
                        color: Colors.yellow.shade800,
                        size: 25,
                      ),
                    ),
                    Text("4.5/5",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                    SizedBox(width: 10,),
                    Text("(45 Reviews)",style: TextStyle(fontSize: 16,color: MyColors.textColorSecodary),)
                  ],
                ),
              ),
              Container(
                child: Text(
                  "${description}",
                  style: TextStyle(
                      fontSize: 16, color: MyColors.textColorSecodary),
                ),
              ),
              Styles.hMargin,
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Price",style: TextStyle(fontSize: 16,color: MyColors.textColorSecodary),),
                        Text("USD ${price}",style: TextStyle(fontSize: 20,color: MyColors.primary,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ),
                      style: ElevatedButton.styleFrom(

                          backgroundColor: MyColors.primary,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          ),
                          foregroundColor: MyColors.primary),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getProductDetail() {
    title = widget.product!.attributes!.title ?? "Product Title";
    description = widget.product!.attributes!.description ?? "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim.";
    price = widget.product!.attributes!.price ?? "0.0";
  }
}
