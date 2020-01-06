// To parse this JSON data, do
//final pokedex = pokedexFromJson(jsonString);
import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productToJson(Products data) => json.encode(data.toJson());

class Products {
  List<Datum> data;
  Links links;
  Meta meta;

  Products({
    this.data,
    this.links,
    this.meta,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  int id;
  String type;
  String name;
  String urlKey;
  int price;
  String formatedPrice;
  String shortDescription;
  String description;
  String sku;
  List<PImage> images;
  BaseImage baseImage;
  List<dynamic> variants;
  bool inStock;
  int specialPrice;
  String formatedSpecialPrice;
  Reviews reviews;
  bool isSaved;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    this.id,
    this.type,
    this.name,
    this.urlKey,
    this.price,
    this.formatedPrice,
    this.shortDescription,
    this.description,
    this.sku,
    this.images,
    this.baseImage,
    this.variants,
    this.inStock,
    this.specialPrice,
    this.formatedSpecialPrice,
    this.reviews,
    this.isSaved,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        type: json["type"],
        name: json["name"],
        urlKey: json["url_key"],
        price: json["price"],
        formatedPrice: json["formated_price"],
        shortDescription: json["short_description"],
        description: json["description"],
        sku: json["sku"],
        images:
            List<PImage>.from(json["images"].map((x) => PImage.fromJson(x))),
        baseImage: BaseImage.fromJson(json["base_image"]),
        variants: List<dynamic>.from(json["variants"].map((x) => x)),
        inStock: json["in_stock"],
        specialPrice:
            json["special_price"] == null ? null : json["special_price"],
        formatedSpecialPrice: json["formated_special_price"] == null
            ? null
            : json["formated_special_price"],
        reviews: Reviews.fromJson(json["reviews"]),
        isSaved: json["is_saved"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "name": name,
        "url_key": urlKey,
        "price": price,
        "formated_price": formatedPrice,
        "short_description": shortDescription,
        "description": description,
        "sku": sku,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "base_image": baseImage.toJson(),
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "in_stock": inStock,
        "special_price": specialPrice == null ? null : specialPrice,
        "formated_special_price":
            formatedSpecialPrice == null ? null : formatedSpecialPrice,
        "reviews": reviews.toJson(),
        "is_saved": isSaved,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class BaseImage {
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  BaseImage({
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
    this.originalImageUrl,
  });

  factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        originalImageUrl: json["original_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
      };
}

class PImage {
  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  PImage({
    this.id,
    this.path,
    this.url,
    this.originalImageUrl,
    this.smallImageUrl,
    this.mediumImageUrl,
    this.largeImageUrl,
  });

  factory PImage.fromJson(Map<String, dynamic> json) => PImage(
        id: json["id"],
        path: json["path"],
        url: json["url"],
        originalImageUrl: json["original_image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "url": url,
        "original_image_url": originalImageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
      };
}

class Reviews {
  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  Reviews({
    this.total,
    this.totalRating,
    this.averageRating,
    this.percentage,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
        percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": List<dynamic>.from(percentage.map((x) => x)),
      };
}

class Links {
  String first;
  String last;
  dynamic prev;
  dynamic next;

  Links({
    this.first,
    this.last,
    this.prev,
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );

  Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
      };
}

class Meta {
  int currentPage;
  int from;
  int lastPage;
  String path;
  int perPage;
  int to;
  int total;

  Meta({
    this.currentPage,
    this.from,
    this.lastPage,
    this.path,
    this.perPage,
    this.to,
    this.total,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
      };
}
