class Category_Model {
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

  Category_Model(
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

  Category_Model.fromJson(Map<String, dynamic> json) {
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
