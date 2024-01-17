import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String name;
  final String iconName;
  final String docRef;
  final List machines;

  ProductModel(
      {required this.name,
      required this.iconName,
      required this.machines,
      this.docRef = ""});

  bool isAvailable() {
    for (var machineInfo in machines) {
      bool availability = machineInfo?["availability"] ?? true;
      if (!availability) return false;
    }
    return true;
  }

  bool isAvailableOnMachine(String machineRef) {
    var currentMachine = machines.firstWhere(
      (element) => element["machine"] == machineRef,
      orElse: () => null,
    );
    if (currentMachine == null) return false;
    return currentMachine["availability"];
  }

  factory ProductModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return ProductModel(
        docRef: snapshot.id,
        name: data?['name'] ?? "Error",
        iconName: data?['iconName'] ?? "coffee_cup.png",
        machines: data?["machines"] ?? []);
  }

  Map<String, dynamic> toFirestore() {
    return {"name": name, "iconName": iconName, "machines": machines};
  }
}
