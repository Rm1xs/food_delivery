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
  Future<void> removeFromOrder(String id) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final Map<String, dynamic> myMap = <String, dynamic>{};

    final DocumentSnapshot<Map<String, dynamic>> data = await FirebaseFirestore
        .instance
        .collection('Delivery Profiles')
        .doc(idToken)
        .get();
    final List<dynamic> result = data.data()!.values.elementAt(2);
    await FirebaseFirestore.instance
        .collection('Delivery Profiles')
        .doc(idToken.toString())
        .update({'orders': <dynamic>[]});
    result.forEach((dynamic element) {
      if (element.keys.elementAt(0) != id) {
        //print(element.keys.elementAt(0));
        myMap.addAll(element);
        print(myMap.toString());
        pushToDb(myMap);
        myMap.clear();
      }
    });
  }

  Future<void> pushToDb(Map<String, dynamic> data) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    await FirebaseFirestore.instance
        .collection('Delivery Profiles')
        .doc(idToken.toString())
        .update({
      'orders': FieldValue.arrayUnion(<dynamic>[data])
    }).whenComplete(() => print('compl'));
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
    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance
            .collection('Delivery Profiles')
            .doc(idToken)
            .get();
    return document;
  }

  @override
  Future<int> getOrderPrice() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    int price = 0;
    final DocumentSnapshot<Map<String, dynamic>> document =
        await FirebaseFirestore.instance
            .collection('Delivery Profiles')
            .doc(idToken)
            .get();
    document.data()!['orders'].forEach((dynamic element) => <dynamic>{
          element.values.forEach(
              (dynamic value) => {price += int.parse(value.keys.elementAt(0))}),
        });
    return price;
  }
}
