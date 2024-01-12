import 'package:cloud_firestore/cloud_firestore.dart';

class MachineModel {
  final String position;
  final bool cardAvailable;

  const MachineModel({required this.position, this.cardAvailable = true});

  factory MachineModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MachineModel(
        position: data?["position"] ?? "Error",
        cardAvailable: data?["cardAvailable"]);
  }

  Map<String, dynamic> toFirestore() {
    return {"position": position, "cardAvailable": cardAvailable};
  }
}
