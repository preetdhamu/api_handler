
class AllProductsModel {
  String? status;
  String? message;
  List<Products>? products;

  AllProductsModel({this.status, this.message, this.products});

  AllProductsModel.fromJson(Map<dynamic, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["status"] = status;
    _data["message"] = message;
    if(products != null) {
      _data["products"] = products?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
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
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["price"] is int) {
      price = json["price"];
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
    if(json["discount"] is int) {
      discount = json["discount"];
    }
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
}