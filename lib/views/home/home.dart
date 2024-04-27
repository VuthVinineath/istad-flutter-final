import 'package:ecommerce_clothes/constants/colors.dart';
import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:ecommerce_clothes/constants/styles.dart';
import 'package:ecommerce_clothes/views/home/skeletons/product_skeleton.dart';
import 'package:ecommerce_clothes/views/home/viewmodels/products_vm.dart';
import 'package:ecommerce_clothes/views/home/widgets/add_products.dart';
import 'package:ecommerce_clothes/views/home/widgets/homecategory.dart';
import 'package:ecommerce_clothes/views/home/widgets/product_card.dart';
import 'package:ecommerce_clothes/views/home/widgets/searchbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../data/response/status.dart';
import 'widgets/product_detail.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Controller
  TextEditingController searchController = TextEditingController();

  // Variable
  List<String> category = ["All", "Men", "Women", "Kids", "Spring"];
  bool isFavorite = false;
  List<int> selectedFavorite = [];

  // For Fetch API
  var _productViewModel = ProductsViewModel();
  late var product;

  @override
  void initState() {
    super.initState();
    _productViewModel.getAllProducts();
  }

  // Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(45),
            child: Image.asset("assets/images/profile.jpg"),
          ),
        ),
        title: const Column(
          children: [
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Vinineath Vuth",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Arial"))),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Cambodia",
                    style: TextStyle(
                      fontSize: 14,
                    ))),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {
                print("Notification is clicked");
              },
              icon: const Icon(
                FontAwesomeIcons.solidBell,
                size: 20,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddProducts()));
              },
              icon: const Icon(
                FontAwesomeIcons.solidSquarePlus,
                size: 20,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MySize.marginA),
          padding: EdgeInsets.symmetric(horizontal: MySize.py),
          child: Column(
            children: [
              // Mark : Search & Filter Button
              SearchFilter(searchController: searchController),
              Styles.hMargin,
              // Mark : Product Category
              HomeCategory(category: category),
              Styles.hMargin,
              // Mark : View All
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "T-shirt",
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
              // Mark : Product Card
              Container(
                child: ChangeNotifierProvider(
                  create: (context)=>_productViewModel,
                  child: Consumer<ProductsViewModel>(
                    builder: (context, viewModel, _) {
                      switch(viewModel.response.status!){
                        case Status.LOADING:
                          return ProductSkeleton();
                        case Status.COMPLETE:
                         return Container(
                           child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16.0,
                                mainAxisExtent: 310,
                                childAspectRatio:
                                MediaQuery.of(context).size.width /
                                    (MediaQuery.of(context).size.height)),
                            itemCount: 24,
                            itemBuilder: (context, index) {
                              product = viewModel.response.data!.data![index];
                              return ProductCard(selectedFavorite: selectedFavorite,index: index,product: product,);
                            },
                                                   ),
                         );
                          
                        case Status.ERROR:
                          return Text('Error');
                      }

                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
