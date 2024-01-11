import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final String iconName;
  final List machines;

  ProductModel(
      {required this.name, required this.iconName, required this.machines});

  bool isAvailable() {
    for (var machineInfo in machines) {
      bool availability = machineInfo?["availability"] ?? true;
      if (!availability) return false;
    }
    return true;
  }

  factory ProductModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return ProductModel(
        name: data?['name'] ?? "Error",
        iconName: data?['iconName'] ?? "coffee_cup.png",
        machines: data?["machines"] ?? []);
  }

  Map<String, dynamic> toFirestore() {
    return {"name": name, "iconName": iconName, "machines": machines};
  }
}
