import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/delivery/data/models/delivery_model.dart';
import 'package:food_delivery/features/delivery/domain/repositories/delivery_repository.dart';

class DeliveryRepositoryImplementation implements DeliveryRepository {
  @override
  Future<DocumentSnapshot<Object?>> getDelivery() {
    // TODO: implement getDelivery
    throw UnimplementedError();
  }

  @override
  Future<void> saveDelivery(String id, List<String> items, String price,
      String adress, String date) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference data =
        FirebaseFirestore.instance.collection('Delivery');
    final DeliveryModel post = DeliveryModel(id, items, price, adress, date);
    final Map<String, dynamic> postData = post.toJson();
    await data.doc(idToken.toString()).set(postData);
  }
}
