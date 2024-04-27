import 'dart:io';
import 'package:ecommerce_clothes/constants/sizes.dart';
import 'package:ecommerce_clothes/views/home/models/product_request.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../data/response/status.dart';
import '../../../res/app_url.dart';
import '../viewmodels/image_viewmodel.dart';
import '../viewmodels/productrequest_vm.dart';

class AddProducts extends StatefulWidget {
  const AddProducts({super.key});

  @override
  State<AddProducts> createState() => _AddProductsState();
}

class _AddProductsState extends State<AddProducts> {
  bool isPicked = false;
  var imageID;
  final _imageViewModel = ImageViewModels();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final _productViewModel = ProductsRequestViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(MySize.marginA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ChangeNotifierProvider(
                create: (context) => _imageViewModel,
                child: Consumer<ImageViewModels>(
                  builder: (context, viewModel, _) {
                    if (viewModel.response.status == null) {
                      return InkWell(
                        onTap: () {
                          _getImageFromSource();
                        },
                        child: Image.network(
                            'https://www.shutterstock.com/image-vector/default-ui-image-placeholder-wireframes-600nw-1037719192.jpg',
                            fit: BoxFit.contain),
                      );
                    }
                    switch (viewModel.response.status!) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.COMPLETE:
                        imageID = viewModel.response.data[0].id;
                        return InkWell(
                          onTap: () {
                            _getImageFromSource();
                          },
                          child: SizedBox(
                            width: double.infinity,
                            height: 250,
                            child: Image.network(
                                '${AppUrl.baseUrl}${viewModel.response.data[0].url!}',
                                fit: BoxFit.contain),
                          ),
                        );
                      case Status.ERROR:
                        return Text(viewModel.response.message!);
                    }
                  },
                ),
              ),
              Styles.hMargin,
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                  border: OutlineInputBorder(),
                ),
              ),
              Styles.hMargin,
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                    hintText: 'Description', border: OutlineInputBorder()),
              ),
              Styles.hMargin,
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                    hintText: 'Price', border: OutlineInputBorder()),
              ),
              Styles.hMargin,
              Container(
                width: double.infinity,
                height: 50,
                child: ChangeNotifierProvider(
                  create: (context) => _productViewModel,
                  child: Consumer<ProductsRequestViewModel>(
                      builder: (context, viewModel, _) {
                    if (viewModel.response.status == null) {
                      return ElevatedButton(
                        onPressed: () {
                          _saveProducts();
                        },
                        child: Text(
                          "Add Product",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: MyColors.primary,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                            foregroundColor: MyColors.primary),
                      );
                    }
                    ;
                    switch (viewModel.response.status!) {
                      case Status.LOADING:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case Status.COMPLETE:
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Center(
                                child: Text("Post Success"),
                              ),
                            ),
                          );
                        });
                        return ElevatedButton(
                          onPressed: () {
                            _saveProducts();
                          },
                          child: Text(
                            "Add Product",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MyColors.primary,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.zero,
                              ),
                              foregroundColor: MyColors.primary),
                        );
                      case Status.ERROR:
                        return Text(viewModel.response.message!);
                    }
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _getImageFromSource() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile != null) {
      _imageViewModel.uploadImage(pickedFile.path);
      print("Picked Image : ${File(pickedFile.path)}");
    }
  }

  void _saveProducts() {
    var productRequest = ProductsRequest(
        data: Data(
            title: titleController.text,
            description: titleController.text,
            price: priceController.text,
            thumbnail: imageID.toString()));
    _productViewModel.postProduct(productRequest);
    print(imageID.toString());
    print('title : ${titleController.text}');
    print('descritpion : ${descriptionController.text}');
    print('price : ${priceController.text}');
  }
}
