part of breadking_model;

class ModelFood {
  final String image;
  final String name;
  final String kind;
  final String description;
  final double rating;
  final double price;
  final String distance;
  
  ModelFood({
    this.image = '',
    this.name = '',
    this.kind = '',
    this.description = '',
    this.rating = 0.0,
    this.price = 0.0,
    this.distance = '',
  });


  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'kind': kind,
      'description': description,
      'rating': rating,
      'price': price,
      'distance': distance,
    };
  }

  factory ModelFood.fromMap(Map<String, dynamic> map) {
    return ModelFood(
      image: map['image'],
      name: map['name'],
      kind: map['kind'],
      description: map['description'],
      rating: map['rating'],
      price: map['price'],
      distance: map['distance'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelFood.fromJson(String source) => ModelFood.fromMap(json.decode(source));
}
