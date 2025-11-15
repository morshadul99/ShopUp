class All_Product_Model {
  int? id;
  String? categoryId;
  String? subCategoryId;
  String? chSubCategoryId;
  String? brandId;
  String? unitId;
  String? name;
  String? slug;
  String? code;
  dynamic? model;
  String? origin;
  dynamic? weight;
  dynamic? serialImei;
  String? shortDescription;
  String? longDescription;
  String? mainImage;
  String? bigImage;
  dynamic? upComImage;
  dynamic? videoUrl;
  String? discount;
  String? sellPrice;
  String? regularPrice;
  String? sellQty;
  String? sellCount;
  String? status;
  dynamic? deletedAt;
  String? createdAt;
  String? updatedAt;
  Category? category;
  SubCategory? subCategory;
  Brand? brand;

  All_Product_Model(
      {this.id,
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
        this.category,
        this.subCategory,
        this.brand});

  All_Product_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    chSubCategoryId = json['ch_sub_category_id'];
    brandId = json['brand_id'];
    unitId = json['unit_id'];
    name = json['name'];
    slug = json['slug'];
    code = json['code'];
    model = json['model'];
    origin = json['origin'];
    weight = json['weight'];
    serialImei = json['serial_imei'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    mainImage = json['main_image'];
    bigImage = json['big_image'];
    upComImage = json['up_com_image'];
    videoUrl = json['video_url'];
    discount = json['discount'];
    sellPrice = json['sell_price'];
    regularPrice = json['regular_price'];
    sellQty = json['sell_qty'];
    sellCount = json['sell_count'];
    status = json['status'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    subCategory = json['sub_category'] != null
        ? new SubCategory.fromJson(json['sub_category'])
        : null;
    brand = json['brand'] != null ? new Brand.fromJson(json['brand']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['sub_category_id'] = this.subCategoryId;
    data['ch_sub_category_id'] = this.chSubCategoryId;
    data['brand_id'] = this.brandId;
    data['unit_id'] = this.unitId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['code'] = this.code;
    data['model'] = this.model;
    data['origin'] = this.origin;
    data['weight'] = this.weight;
    data['serial_imei'] = this.serialImei;
    data['short_description'] = this.shortDescription;
    data['long_description'] = this.longDescription;
    data['main_image'] = this.mainImage;
    data['big_image'] = this.bigImage;
    data['up_com_image'] = this.upComImage;
    data['video_url'] = this.videoUrl;
    data['discount'] = this.discount;
    data['sell_price'] = this.sellPrice;
    data['regular_price'] = this.regularPrice;
    data['sell_qty'] = this.sellQty;
    data['sell_count'] = this.sellCount;
    data['status'] = this.status;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.subCategory != null) {
      data['sub_category'] = this.subCategory!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    return data;
  }
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
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id,
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
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    note = json['note'];
    image = json['image'];
    catCode = json['cat_code'];
    catLevel = json['cat_level'];
    serial = json['serial'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['note'] = this.note;
    data['image'] = this.image;
    data['cat_code'] = this.catCode;
    data['cat_level'] = this.catLevel;
    data['serial'] = this.serial;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class SubCategory {
  int? id;
  String? name;
  String? slug;
  dynamic? icon;
  dynamic? note;
  String? image;
  String? catCode;
  String? catLevel;
  dynamic? serial;
  String? status;
  String? createdAt;
  String? updatedAt;

  SubCategory(
      {this.id,
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
        this.updatedAt});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    icon = json['icon'];
    note = json['note'];
    image = json['image'];
    catCode = json['cat_code'];
    catLevel = json['cat_level'];
    serial = json['serial'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['icon'] = this.icon;
    data['note'] = this.note;
    data['image'] = this.image;
    data['cat_code'] = this.catCode;
    data['cat_level'] = this.catLevel;
    data['serial'] = this.serial;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Brand {
  int? id;
  String? categoryId;
  String? name;
  String? slug;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Brand(
      {this.id,
        this.categoryId,
        this.name,
        this.slug,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
