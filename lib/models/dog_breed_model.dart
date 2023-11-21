class DogBreed {
  String name;
  String image;
  List<String> subBreeds; 

  DogBreed({
    required this.name,
    this.image = "",
    this.subBreeds = const [], 
  });

  factory DogBreed.fromJson(Map<String, dynamic> json) {
    return DogBreed(
      name: json['name'],
      image: json['image'],
      subBreeds: List<String>.from(json['subBreeds'] ?? []), 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'subBreeds': subBreeds,
    };
  }
}
