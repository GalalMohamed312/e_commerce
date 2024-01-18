import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(0, 197, 105, 1);
const String cartDB="CartDB.db";
const String tableCartProduct="cartProduct";
const String columnName="name";
const String columnQuantity="quantity";
const String columnPrice="price";
const String columnImage="image";
const String columnId="id";
// const String columnStorage ="storage";
// const String columnCamera="camera";
// const String columnBattery="battery";
// const String columnColor="color";
// const String columnProcessor="processor";
const String cachedUserData="user";
const kTileHeight = 50.0;
const inProgressColor = Colors.black87;
const todoColor = Color(0xffd1d2d7);

enum Pages {
  deliveryTime,
  addAddress,
  summary,
}
