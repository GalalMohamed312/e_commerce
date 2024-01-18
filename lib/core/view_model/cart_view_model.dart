import 'package:ecommerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../service/local_database/cart_local_database.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> get loading => _loading;
  final ValueNotifier<bool> _loading = ValueNotifier(false);
  final ValueNotifier<bool> checkData = ValueNotifier(true);

  List<CartProductModel> get allProductModel => _allProductModel;
  List<CartProductModel> _allProductModel = [];
  double _price=0.0;
  double get price=>_price;
  final _localDB = CartLocalDatabase.db;
  CartViewModel() {
      getAllProducts();

  }

  addProductToCart(CartProductModel cartProductModel) async {
    checkData.value=false;
    if(_allProductModel.isEmpty){
      await _localDB.insertDB(cartProductModel);
      _allProductModel.add(cartProductModel);

    }
    else{
      for(int i=0;i< _allProductModel.length;i++){
        if(_allProductModel[i].id==cartProductModel.id) {
          print("id is =========}${_allProductModel.length}");
          return;
        }
      }
      print("id is =========}inserted==========");
      await _localDB.insertDB(cartProductModel);
      _allProductModel.add(cartProductModel);

    }
    _price+=cartProductModel.price!;

    // print("adeed");
    update();
  }
  getAllProducts()async{
    _loading.value = true;

    _allProductModel=await _localDB.getAllProducts().then((value){

      return value;
    }).catchError((e){
      print("data error-----===---=--$e");
    });
    _loading.value = false;
    print(_allProductModel.length);
    getTotalPrice();
    update();
  }
  getTotalPrice(){
    for(int i=0;i<_allProductModel.length;i++){
      _price+=(_allProductModel[i].price!*_allProductModel[i].quantity!);
    }
    update();
  }
  increaseQuantity(int index){
    _allProductModel[index].quantity=(_allProductModel[index].quantity!+1);
    _price+=(_allProductModel[index].price!);
    _localDB.updateCartProduct(_allProductModel[index]);
    update();
  }
  decreaseQuantity(int index){
    if(_allProductModel[index].quantity!>0)
    {
      _allProductModel[index].quantity=(_allProductModel[index].quantity!-1);
      _price-=_allProductModel[index].price!;
      _localDB.updateCartProduct(_allProductModel[index]);
      update();
    }
  }
}

