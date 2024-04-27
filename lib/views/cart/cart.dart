import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "My Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(top: 12, bottom: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            "https://i.pinimg.com/originals/a3/64/0b/a3640b6bc80a86f0947b8eae8c3e0a31.jpg",
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: 100,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Product Name",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: MyColors.primary,
                                    fontFamily: 'opensan',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$ 10.0",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: MyColors.textColorSecodary,
                                    fontFamily: 'opensan',
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          // Increase & Decrease Cart Item
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    elevation: 5,
                                    child: Icon(
                                      FontAwesomeIcons.plus,
                                      size: 16,
                                    ),
                                    backgroundColor: Colors.white,
                                    foregroundColor: MyColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                  ),
                                ),
                              ),
                              Styles.vMargin,
                              Text(
                                "3",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Styles.vMargin,
                              SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    onPressed: () {},
                                    elevation: 5,
                                    child: Icon(
                                      FontAwesomeIcons.minus,
                                      size: 16,
                                    ),
                                    backgroundColor: Colors.white,
                                    foregroundColor: MyColors.primary,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Text(
                "Total Price Payable",
                style: TextStyle(
                    color: MyColors.textColorSecodary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "\$ 40.00",
                style: TextStyle(
                    color: MyColors.primary,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Styles.hMargin,
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Process to checkout",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primary,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      foregroundColor: MyColors.primary),
                ),
              ),
              SizedBox(
                height: 6,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Continue to shopping",
                    style: TextStyle(color: MyColors.primary, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      side: BorderSide(color: MyColors.primary)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
