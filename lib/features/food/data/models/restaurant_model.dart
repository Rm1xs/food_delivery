class RestaurantModel {
  final List<RestaurantInfo> results;

  RestaurantModel({
    required this.results,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      results: List<RestaurantInfo>.from(
          json['results'].map((x) => RestaurantInfo.fromJson(x))),
    );
  }
}

class RestaurantInfo {
  Poi poi;
  double dist;

  RestaurantInfo({required this.poi, required this.dist});

  factory RestaurantInfo.fromJson(Map<String, dynamic> json) {
    return RestaurantInfo(
      poi: Poi.fromJson(json['poi']),
      dist: json['dist'],
    );
  }
}

class Poi {
  String name;

  Poi({
    required this.name,
  });

  factory Poi.fromJson(Map<String, dynamic> json) {
    return Poi(name: json['name']);
  }
}
