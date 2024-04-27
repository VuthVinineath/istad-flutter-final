import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:ecommerce_clothes/views/category/viewmodels/category_viewmodels.dart';
import 'package:ecommerce_clothes/views/home/widgets/homecategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../res/app_url.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<String> category = ["Formal", "Causaul", "Winter", "Spring", "Summer"];
  late PageController pageController;
  int pageNo = 0;

  // Get Category
  var _categoryViewModel = CategoryViewModel();
  late var categoryData;

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    super.initState();
    _categoryViewModel.getAllProducts();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Categories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print("Notification is clicked");
                },
                icon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 20,
                )),
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
            children: [
              SizedBox(
                width: double.infinity,
                height: 50,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        final categoryName = category[index];
                        return Container(
                          width: 100,
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
                      }),
              ),
              Styles.hMargin,
              // Category Horizontal scroll
              SizedBox(
                width: double.infinity,
                height: 200,
                child: ChangeNotifierProvider(
                  create: (context)=>_categoryViewModel,
                  child: ChangeNotifierProvider(
                    create: (context)=>_categoryViewModel,
                    child: Consumer<CategoryViewModel>(
                      builder: (context,viewModel,_){
                        return PageView.builder(
                          controller: pageController,
                          onPageChanged: (index) {
                            setState(() {
                              pageNo = index;
                            });
                          },
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            categoryData = viewModel.response.data!.data![index];
                            return AnimatedBuilder(
                              animation: pageController,
                              builder: (ctx, child) {
                                return child!;
                              },
                              child: Container(
                                height: 100,
                                margin: EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0),
                                ),
                                child: Image.network(
                                  '${categoryData!.attributes.iconUrl??"https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg"}',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            );
                          },
                          padEnds: false,
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) => Container(
                    margin: EdgeInsets.all(4.0),
                    child: Icon(Icons.circle,
                        size: 12.0,
                        color:
                            pageNo == index ? MyColors.primary : Colors.grey),
                  ),
                ).toList(),
              ),
              Styles.hMargin,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Collections",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      print("View All");
                    },
                    child: Text("View All"),
                    style: TextButton.styleFrom(
                        foregroundColor: MyColors.primary,
                        splashFactory: NoSplash.splashFactory),
                  )
                ],
              ),
              Styles.hMargin,
              Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Image.network(
                        "https://images.pexels.com/photos/5872364/pexels-photo-5872364.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  itemCount: 4,
                  physics: const NeverScrollableScrollPhysics(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
