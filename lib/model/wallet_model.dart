class Wallet {
  String id;
  String name;
  int value;

  Wallet({
    required this.id,
    required this.name,
    required this.value
  });

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'value': value
  };

  Wallet copyWith({
    String? id,
    String? name,
    String? value,
  }) => Wallet(
    id: this.id, 
    name: this.name, 
    value: this.value
  );
}