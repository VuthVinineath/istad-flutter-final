import 'package:ecommerce_clothes/res/app_url.dart';
import 'package:ecommerce_clothes/views/home/models/products.dart';
import 'package:ecommerce_clothes/views/home/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    this.selectedFavorite,
    this.index,
    this.product,
  });

  List<int>? selectedFavorite;
  int? index;
  Datum? product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    color: MyColors.secondary,
                    //padding: EdgeInsets.all(10),
                    child: Image.network(
                      '${AppUrl.baseUrl}${widget.product!.attributes!.thumbnail!.data!.attributes!.url??"https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg"}',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: 250,
                    ),
                  )),
              Positioned(
                  right: 15,
                  top: 15,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: MyColors.primary.withOpacity(0.1),
                          spreadRadius: 7,
                          blurRadius: 10,
                          offset: Offset(0, 5))
                    ]),
                    child: IconButton(
                        onPressed: () {
                          setState(
                            () {
                              if (widget.selectedFavorite!.contains(widget.index!)) {
                                widget.selectedFavorite!.remove(widget.index!);
                              } else {
                                widget.selectedFavorite!.add(widget.index!);
                              }
                            },
                          );
                        },
                        icon: Icon(widget.selectedFavorite!.contains(widget.index)
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart)),
                  ))
            ],
          ),
          Text(
            widget.product!.attributes!.title.toString(),
            style: TextStyle(
                fontSize: 18, color: MyColors.primary, fontFamily: 'opensan'),
          ),
          Text(
            "\$ ${widget.product!.attributes!.price.toString()}",
            style: TextStyle(fontSize: 16, color: MyColors.textColorSecodary),
          ),
        ],
      )),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetail(product:widget.product!),
            ),
          );
        }
    );
  }
}
