import 'package:ecommerce_clothes/views/home/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../constants/colors.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      child: Container(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16.0,
                mainAxisExtent: 310,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height)),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Container(
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
                              "https://i.pinimg.com/originals/a3/64/0b/a3640b6bc80a86f0947b8eae8c3e0a31.jpg",
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 250,
                            ),
                          )),
                      Positioned(
                        right: 15,
                        top: 15,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: MyColors.primary.withOpacity(0.1),
                                  spreadRadius: 7,
                                  blurRadius: 10,
                                  offset: Offset(0, 5))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Regular Fit Slogan",
                    style: TextStyle(
                        fontSize: 18,
                        color: MyColors.primary,
                        fontFamily: 'opensan'),
                  ),
                  Text(
                    "\$ 10.0",
                    style: TextStyle(
                        fontSize: 16, color: MyColors.textColorSecodary),
                  ),
                ],
              ));
            }),
      ),
    );
  }
}
