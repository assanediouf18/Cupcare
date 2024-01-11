import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupcare/Model/product_model.dart';

class DatabaseService {
  final CollectionReference products =
      FirebaseFirestore.instance.collection("products");

  Stream<Iterable<ProductModel>> getProducts() {
    var ref = products.withConverter(
        fromFirestore: ProductModel.fromFirestore,
        toFirestore: (ProductModel product, _) => product.toFirestore());
    return ref
        .get()
        .asStream()
        .map((snapshot) => snapshot.docs.map((e) => e.data()));
  }
}
