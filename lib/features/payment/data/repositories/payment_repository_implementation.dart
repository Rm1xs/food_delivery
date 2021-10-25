import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/payment/data/models/card_model.dart';
import 'package:food_delivery/features/payment/domain/repositories/payment_repository.dart';

class PaymentRepositoryImplementation implements PaymentRepository {

  @override
  Future<void> saveCardInfo(
      String number, String dateTime, String holder, String cvv) async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference card =
        FirebaseFirestore.instance.collection('Cards');
    CardModel post = CardModel(number, dateTime, holder, cvv);
    Map<String, dynamic> postData = post.toJson();
    await card.doc(idToken.toString()).set(postData);
  }

  @override
  Future<void> validateCard() {
    // TODO: implement validateCard
    throw UnimplementedError();
  }

  @override
  Future<bool> checkCard() async {
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    try {
      var collectionRef = FirebaseFirestore.instance.collection('Cards');

      var doc = await collectionRef.doc(idToken).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
}
