// ignore_for_file: non_constant_identifier_names

class Transaction {
  String id;
  String description;
  String date;
  int value;
  String category_id;
  bool is_notified;
  String user_id;
  String wallet_id;

  String? name;
  String? image;

  Map<String, dynamic>? category;

  Transaction({
    required this.id,
    required this.description,
    required this.date,
    required this.value,
    required this.category_id,
    required this.is_notified,
    required this.user_id,
    required this.wallet_id,
    this.category,
    this.name,
    this.image
  });


  Map<String, dynamic> toJson() => {
    'id': id,
    'description': description,
    'date': date,
    'value': value,
    'category_id': category_id,
    'is_notified': is_notified,
    'user_id': user_id,
    'wallet_id': wallet_id,
    'name': name,
    'image': image
  };

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      description: json['description'], 
      date: json['date'],
      value: json['value'],
      category_id: json['category_id'],
      is_notified: json['is_notified'] == 0 ? false : true,
      user_id: json['user_id'],
      wallet_id: json['wallet_id'],
      category: json['Categories'],
      name: json['name'],
      image: json['image']
    );
  }
}

List<Transaction> TransactionFromJson(List<Map<String, dynamic>> jsondata) {
  return List.from(jsondata.map((item) => Transaction.fromJson(item)));
}