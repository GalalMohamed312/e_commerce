import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('Categories');
  final CollectionReference _productCollectionRef =
      FirebaseFirestore.instance.collection('Products');

  final CollectionReference _laptopCollectionRef =
  FirebaseFirestore.instance.collection('Laptop');

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productCollectionRef.get();

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getLaptops() async {
    var value = await _laptopCollectionRef.get();

    return value.docs;
  }
}
