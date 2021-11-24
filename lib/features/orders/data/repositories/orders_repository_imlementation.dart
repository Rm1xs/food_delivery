import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/orders/domain/repositories/orders_repository.dart';

class OrdersRepositoryImplementation implements OrdersRepository {

  @override
  Future<void> addToOrder(String food) async {
    // TODO: implement getStatusOrder
    throw UnimplementedError();
  }

  @override
  Future<void> getStatusOrder() {
    // TODO: implement getStatusOrder
    throw UnimplementedError();
  }

  @override
  Future<void> removeFromOrder() {
    // TODO: implement removeFromOrder
    throw UnimplementedError();
  }

  @override
  Future<void> saveOrder() {
    // TODO: implement saveOrder
    throw UnimplementedError();
  }

  @override
  Future<DocumentSnapshot> getItemsInOrder() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    var document = await FirebaseFirestore.instance
        .collection('Delivery Profiles')
        .doc(idToken).get();
    return document;
  }
}