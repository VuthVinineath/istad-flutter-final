import 'package:ecommerce_clothes/constants/colors.dart';
import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
                filled: true,
                fillColor: MyColors.secondary,
                prefixIcon: Icon(FontAwesomeIcons.magnifyingGlass,
                    size: MySize.iconSize,
                    color: MyColors.preFixiconColor),
                hintText: "Search Anything",
                hintStyle:
                TextStyle(color: MyColors.textFieldHintColor),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: MyColors.textFillColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color:
                        MyColors.underlineInputBorderColor))),
          ),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            print(searchController.text);
          },
          child: Icon(Icons.sort),
          style: ElevatedButton.styleFrom(
              backgroundColor: MyColors.primary,
              foregroundColor: Colors.white,
              padding: EdgeInsets.all(10),
              shadowColor: Colors.grey.shade300,
              shape: RoundedRectangleBorder()),
        )
      ],
    );
  }
}