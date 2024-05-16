
class ProductModel {
  String? status;
  String? message;
  List<Products>? products;

  ProductModel({this.status, this.message, this.products});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["message"] is String) {
      message = json["message"];
    }
    if(json["products"] is List) {
      products = json["products"] == null ? null : (json["products"] as List).map((e) => Products.fromJson(e)).toList();
    }
  }

  static List<ProductModel> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ProductModel.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return _data;
  }

  ProductModel copyWith({
    String? status,
    String? message,
    List<Products>? products,
  }) => ProductModel(
    status: status ?? this.status,
    message: message ?? this.message,
    products: products ?? this.products,
  );
}

class Products {
  int? id;
  String? title;
  String? image;
  int? price;
  String? description;
  String? brand;
  String? model;
  String? color;
  String? category;
  int? discount;

  Products({this.id, this.title, this.image, this.price, this.description, this.brand, this.model, this.color, this.category, this.discount});

  Products.fromJson(Map<String, dynamic> json) {
    if(json["id"] is num) {
      id = (json["id"] as num).toInt();
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["price"] is num) {
      price = (json["price"] as num).toInt();
    }
    if(json["description"] is String) {
      description = json["description"];
    }
    if(json["brand"] is String) {
      brand = json["brand"];
    }
    if(json["model"] is String) {
      model = json["model"];
    }
    if(json["color"] is String) {
      color = json["color"];
    }
    if(json["category"] is String) {
      category = json["category"];
    }
    if(json["discount"] is num) {
      discount = (json["discount"] as num).toInt();
    }
  }

  static List<Products> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Products.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["title"] = title;
    _data["image"] = image;
    _data["price"] = price;
    _data["description"] = description;
    _data["brand"] = brand;
    _data["model"] = model;
    _data["color"] = color;
    _data["category"] = category;
    _data["discount"] = discount;
    return _data;
  }

  Products copyWith({
    int? id,
    String? title,
    String? image,
    int? price,
    String? description,
    String? brand,
    String? model,
    String? color,
    String? category,
    int? discount,
  }) => Products(
    id: id ?? this.id,
    title: title ?? this.title,
    image: image ?? this.image,
    price: price ?? this.price,
    description: description ?? this.description,
    brand: brand ?? this.brand,
    model: model ?? this.model,
    color: color ?? this.color,
    category: category ?? this.category,
    discount: discount ?? this.discount,
  );
}