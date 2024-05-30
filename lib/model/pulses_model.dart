class PulsesModel{
  final String itemName;
  final double price;
  final int qty;
  final String description;
  final String image;
  final String id;
  PulsesModel({
    required this.itemName,
    required this.price,
    required this.qty,
    required this.description,
    required this.image,
    required this.id
  });
  Map<String,dynamic> toMap(){
    return{
      "itemName" : this.itemName,
      "price" : this.price,
      "qty" : this.qty,
      "description":this.description,
      "image" : this.image,
      "id": this.id

    };
  }
  factory PulsesModel.fromMap(Map<String,dynamic>map){
    return PulsesModel(
        itemName: map["itemName"] ?? "",
        price: map["price"] ?? "",
        qty: map["qty"] ?? "",
        description: map["description"] ?? "",
        image: map["image"] ?? "",
        id: map["id"] ?? ""
    );
  }
   PulsesModel copyWith({
    String? itemName,
    double? price,
    int? qty,
    String? description,
    String? image,
    String? id
  }){
    return PulsesModel(
        itemName: itemName ?? this.itemName,
        price: price ?? this.price,
        qty: qty ?? this.qty,
        description: description ?? this.description,
        image: image ?? this.image,
        id: id ?? this.id
    );
  }
}