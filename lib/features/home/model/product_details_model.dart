// To parse this JSON data, do
//
//     final peodutctDetailsModel = peodutctDetailsModelFromJson(jsonString);

import 'dart:convert';

PeodutctDetailsModel peodutctDetailsModelFromJson(String str) => PeodutctDetailsModel.fromJson(json.decode(str));

String peodutctDetailsModelToJson(PeodutctDetailsModel data) => json.encode(data.toJson());

class PeodutctDetailsModel {
  Product? product;
  dynamic colors;
  dynamic sizes;
  List<Product>? relatedProducts;
  Category? subCategory;

  PeodutctDetailsModel({
    this.product,
    this.colors,
    this.sizes,
    this.relatedProducts,
    this.subCategory,
  });

  factory PeodutctDetailsModel.fromJson(Map<String, dynamic> json) => PeodutctDetailsModel(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    colors: json["colors"] == "" ? "" : List<Color>.from(json["colors"]!.map((x) => Color.fromJson(x))),
    sizes: json["sizes"] == "" ? "" : List<Color>.from(json["sizes"]!.map((x) => Color.fromJson(x))),
    relatedProducts: json["relatedProducts"] == null ? [] : List<Product>.from(json["relatedProducts"]!.map((x) => Product.fromJson(x))),
    subCategory: json["subCategory"] == null ? null : Category.fromJson(json["subCategory"]),
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "colors": colors == null ? [] : List<dynamic>.from(colors!.map((x) => x.toJson())),
    "sizes": sizes == null ? [] : List<dynamic>.from(sizes!.map((x) => x.toJson())),
    "relatedProducts": relatedProducts == null ? [] : List<dynamic>.from(relatedProducts!.map((x) => x.toJson())),
    "subCategory": subCategory?.toJson(),
  };
}

class Color {
  int? id;
  String? name;
  String? slug;
  String? attrValue;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Color({
    this.id,
    this.name,
    this.slug,
    this.attrValue,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Color.fromJson(Map<String, dynamic> json) => Color(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    attrValue: json["attr_value"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "attr_value": attrValue,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Product {
  int? id;
  String? categoryId;
  String? subCategoryId;
  String? chSubCategoryId;
  String? brandId;
  String? unitId;
  String? name;
  String? slug;
  String? code;
  dynamic model;
  String? origin;
  dynamic weight;
  dynamic serialImei;
  String? shortDescription;
  String? longDescription;
  String? mainImage;
  String? bigImage;
  dynamic upComImage;
  dynamic videoUrl;
  String? discount;
  String? sellPrice;
  String? regularPrice;
  String? sellQty;
  String? sellCount;
  String? status;
  dynamic deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<SubImage>? subImages;
  Category? category;

  Product({
    this.id,
    this.categoryId,
    this.subCategoryId,
    this.chSubCategoryId,
    this.brandId,
    this.unitId,
    this.name,
    this.slug,
    this.code,
    this.model,
    this.origin,
    this.weight,
    this.serialImei,
    this.shortDescription,
    this.longDescription,
    this.mainImage,
    this.bigImage,
    this.upComImage,
    this.videoUrl,
    this.discount,
    this.sellPrice,
    this.regularPrice,
    this.sellQty,
    this.sellCount,
    this.status,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.subImages,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    categoryId: json["category_id"],
    subCategoryId: json["sub_category_id"],
    chSubCategoryId: json["ch_sub_category_id"],
    brandId: json["brand_id"],
    unitId: json["unit_id"],
    name: json["name"],
    slug: json["slug"],
    code: json["code"],
    model: json["model"],
    origin: json["origin"],
    weight: json["weight"],
    serialImei: json["serial_imei"],
    shortDescription: json["short_description"],
    longDescription: json["long_description"],
    mainImage: json["main_image"],
    bigImage: json["big_image"],
    upComImage: json["up_com_image"],
    videoUrl: json["video_url"],
    discount: json["discount"],
    sellPrice: json["sell_price"],
    regularPrice: json["regular_price"],
    sellQty: json["sell_qty"],
    sellCount: json["sell_count"],
    status: json["status"],
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    subImages: json["sub_images"] == null ? [] : List<SubImage>.from(json["sub_images"]!.map((x) => SubImage.fromJson(x))),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "sub_category_id": subCategoryId,
    "ch_sub_category_id": chSubCategoryId,
    "brand_id": brandId,
    "unit_id": unitId,
    "name": name,
    "slug": slug,
    "code": code,
    "model": model,
    "origin": origin,
    "weight": weight,
    "serial_imei": serialImei,
    "short_description": shortDescription,
    "long_description": longDescription,
    "main_image": mainImage,
    "big_image": bigImage,
    "up_com_image": upComImage,
    "video_url": videoUrl,
    "discount": discount,
    "sell_price": sellPrice,
    "regular_price": regularPrice,
    "sell_qty": sellQty,
    "sell_count": sellCount,
    "status": status,
    "deleted_at": deletedAt,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "sub_images": subImages == null ? [] : List<dynamic>.from(subImages!.map((x) => x.toJson())),
    "category": category?.toJson(),
  };
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? icon;
  String? note;
  String? image;
  String? catCode;
  String? catLevel;
  String? serial;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.slug,
    this.icon,
    this.note,
    this.image,
    this.catCode,
    this.catLevel,
    this.serial,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    icon: json["icon"],
    note: json["note"],
    image: json["image"],
    catCode: json["cat_code"],
    catLevel: json["cat_level"],
    serial: json["serial"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "icon": icon,
    "note": note,
    "image": image,
    "cat_code": catCode,
    "cat_level": catLevel,
    "serial": serial,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class SubImage {
  int? id;
  String? productId;
  String? subImage;
  DateTime? createdAt;
  DateTime? updatedAt;

  SubImage({
    this.id,
    this.productId,
    this.subImage,
    this.createdAt,
    this.updatedAt,
  });

  factory SubImage.fromJson(Map<String, dynamic> json) => SubImage(
    id: json["id"],
    productId: json["product_id"],
    subImage: json["sub_image"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "sub_image": subImage,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
