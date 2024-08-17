class ProductListModel {
  List<Products>? products;

  ProductListModel({this.products});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  String? name;
  String? price;
  String? rating;
  String? imageUrl;

  Products({this.name, this.price, this.rating, this.imageUrl});

  Products.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    rating = json['rating'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['image_url'] = this.imageUrl;
    return data;
  }
}
