class Category {
  String id;
  String type;
  String name;
  String description;
  int? priority;
  String image;

  Category({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    this.priority,
    required this.image
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      type: json['type'], 
      name: json['name'], 
      description: json['description'], 
      priority: json['priority'] ?? 0, 
      image: json['image'] ?? ''
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'name': name,
    'description': description,
    'priority': priority,
    'image': image
  };

  Category copyWith({
    String? id,
    String? type,
    String? name,
    String? description,
    int? priority,
    String? image
  }) => Category(
    id: this.id, 
    type: this.type, 
    name: this.name, 
    description: this.description, 
    priority: this.priority, 
    image: this.image
  );
}

List<Category> categoryFromJson(List<Map<String, dynamic>> jsondata) {
  return List.from(jsondata.map((item) => Category.fromJson(item)));
}