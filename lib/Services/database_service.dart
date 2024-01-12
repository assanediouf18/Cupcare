import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupcare/Model/machine_model.dart';
import 'package:cupcare/Model/product_model.dart';

class DatabaseService {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference _machines =
      FirebaseFirestore.instance.collection("machines");

  Stream<Iterable<ProductModel>> getProducts() {
    var ref = _products.withConverter(
        fromFirestore: ProductModel.fromFirestore,
        toFirestore: (ProductModel product, _) => product.toFirestore());
    return ref
        .get()
        .asStream()
        .map((snapshot) => snapshot.docs.map((e) => e.data()));
  }

  Stream<Iterable<MachineModel>> getMachines() {
    var ref = _machines.withConverter(
        fromFirestore: MachineModel.fromFirestore,
        toFirestore: (MachineModel machine, _) => machine.toFirestore());
    return ref
        .get()
        .asStream()
        .map((snapshot) => snapshot.docs.map((e) => e.data()));
  }
}
