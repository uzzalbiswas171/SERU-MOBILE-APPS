class PackageAllModel {
  List<Data>? data;

  PackageAllModel({this.data});

  PackageAllModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? packageId;
  String? title;
  double? price;
  String? id;
  String? description;
  String? discount;
  int? viewOrder;
  String? activeStstus;
  int? addedBy;
  String? addedDate;

  Data({
    this.packageId,
    this.title,
    this.price,
    this.id,
    this.description,
    this.discount,
    this.viewOrder,
    this.activeStstus,
    this.addedBy,
    this.addedDate,
  });

  Data.fromJson(Map<String, dynamic> json) {
    packageId = json['package_id'];
    title = json['title'];
    price = json['price'] is int ? (json['price'] as int).toDouble() : json['price'];
    id = json['id'];
    description = json['description'];
    discount = json['discount'];
    viewOrder = json['view_order'];
    activeStstus = json['active_ststus'];
    addedBy = json['addedBy'];
    addedDate = json['addedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['package_id'] = this.packageId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['id'] = this.id;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['view_order'] = this.viewOrder;
    data['active_ststus'] = this.activeStstus;
    data['addedBy'] = this.addedBy;
    data['addedDate'] = this.addedDate;
    return data;
  }
}
