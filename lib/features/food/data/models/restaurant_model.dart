class RestaurantModel {
  RestaurantModel({
    required this.results,
  });

  final List<RestaurantInfo> results;

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      results: List<RestaurantInfo>.from(
          json['results'].map((dynamic x) => RestaurantInfo.fromJson(x))),
    );
  }
}

class RestaurantInfo {
  RestaurantInfo({required this.poi, required this.dist});

  Poi poi;
  double dist;

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      poi: Poi.fromJson(json['poi']),
      dist: json['dist'],
    );
  }
}

class Poi {
  Poi({
    required this.name,
  });

  String name;

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(name: json['name']);
  }
}
