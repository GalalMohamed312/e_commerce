import 'package:ecommerce/core/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/category_model.dart';
import '../../model/models.dart';
import '../../model/product_model.dart';
import '../service/home_services.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);

  List<CategoryModel> get categoryModel => _categoryModel;
  final List<CategoryModel> _categoryModel = [
    CategoryModel(name: "mobile", image: ImageAssets.smartphone),
    CategoryModel(name: "laptop", image: ImageAssets.barchart),
    CategoryModel(name: "tablet", image: ImageAssets.tablet),
    CategoryModel(name: "television", image: ImageAssets.television),
  ];



  List<ProductModel> get productModel => _productModel;
  final List<ProductModel> _productModel = [];


  HomeViewModel() {
    // getCategory();
    getBestSellingProducts();
  }

  getCategory() async {
    _loading.value = true;
    HomeService().getCategory().then((value) {
      for (int i = 0; i < value.length; i++) {
        _categoryModel.add(CategoryModel.fromJson(value[i].data()as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      update();
    });
  }

  getBestSellingProducts() async {
    _loading.value = true;
    HomeService().getBestSelling().then((value) {
      for (int i = 0; i < value.length; i++) {
        _productModel.add(ProductModel.fromJson(value[i].data()as Map<dynamic,dynamic>));
        _loading.value = false;
      }
      print(_productModel.length);
      update();
    });
  }
}
