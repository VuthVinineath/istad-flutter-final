import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({
    super.key,
    required this.category,
  });

  final List<String> category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          final categoryName = category[index];
          return Container(
            width: 80,
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(color: MyColors.secondary),
            child: Center(
              child: Text(
                categoryName.toUpperCase(),
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
            ),
          );
        },

      ),
    );
  }
}
