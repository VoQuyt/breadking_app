part of breadking_model;

class ModelTopping {
  final int id;
  final String image;
  ModelTopping({
    this.id = 0,
    this.image = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory ModelTopping.fromMap(Map<String, dynamic> map) {
    return ModelTopping(
      id: map['id'] ?? 0,
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory ModelTopping.fromJson(String source) => ModelTopping.fromMap(json.decode(source));
}
