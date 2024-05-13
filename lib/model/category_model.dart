class Category {
  String type;
  String name;
  String description;
  int priovity;
  String image;

  Category({
    required this.type,
    required this.name,
    required this.description,
    required this.priovity,
    required this.image
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      type: json['type'], 
      name: json['name'], 
      description: json['description'], 
      priovity: json['priovity'], 
      image: json['image']
    );
  }
}