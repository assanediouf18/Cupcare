import 'package:cloud_firestore/cloud_firestore.dart';

class MachineModel {
  final String position;
  final bool cardAvailable;
  final String docRef;

  const MachineModel(
      {required this.position,
      required this.docRef,
      this.cardAvailable = true});

  factory MachineModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options) {
    final data = snapshot.data();
    return MachineModel(
        position: data?["position"] ?? "Error",
        docRef: snapshot.id,
        cardAvailable: data?["cardAvailable"] ?? true);
  }

  Map<String, dynamic> toFirestore() {
    return {"position": position, "cardAvailable": cardAvailable};
  }
}
