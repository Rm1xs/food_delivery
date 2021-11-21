import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/food/data/models/food_model.dart';
import 'package:food_delivery/features/food/data/models/restaurant_model.dart';
import 'package:food_delivery/features/food/domain/repositories/food_repository.dart';
import 'package:food_delivery/features/profile/data/models/delivery_profile.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class FoodRepositoryImplementation implements FoodRepository {

  @override
  Future<RestaurantModel> getRestaurants(double lat, double lon) async {
    String url = 'https://api.tomtom.com/search/2/nearbySearch/.json?lat=$lat&lon=$lon&categorySet=7315&key=GrUWtwXOKPVkDlAnD3R4lzKoKknlhvhH';
    final http.Client client = http.Client();
    final http.Response response = await client.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final RestaurantModel data = RestaurantModel.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception();
    }
  }



  @override
  Future<FoodModel> searchFood(String name) async {
    String query =
        'https://api.edamam.com/search?q=$name&app_id=f54d1c43&app_key=ea6e29f77ce572331ff618bee02f7ab8';
    final http.Client client = http.Client();
    final http.Response response = await client.get(
      Uri.parse(query),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final FoodModel data = FoodModel.fromJson(json.decode(response.body));
      return data;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> addToFavourite(String name, String imageUrl) async {
    Map<String, dynamic> values = {name : imageUrl};
    final User tokenResult = FirebaseAuth.instance.currentUser!;
    final String idToken = tokenResult.uid;
    final CollectionReference profileData =
        FirebaseFirestore.instance.collection('Delivery Profiles');
    //Favourite post = Favourite(name, imageUrl, 123.6);
    await profileData.doc(idToken.toString()).update({
      "favourite" : FieldValue.arrayUnion([values])
    });
  }

  @override
  Future<void> addToOrder(String food) async {
    final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;

    var itemList = prefs.get('orders').toString();
    
    var t = itemList.replaceAll(RegExp(r'[]'),'',);
    print(t);
    var items = <RecipeClassModel>[];

    print(prefs.get('orders'));
  }
}


