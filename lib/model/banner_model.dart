class BannerModel {
  List<Data>? data;

  BannerModel({this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
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
  int? bannerImageId;
  String? imageTitle;
  String? image;
  String? htmlText;
  String? active;
  int? priority;
  int? addedBy;
  String? addedDate;

  Data(
      {this.bannerImageId,
        this.imageTitle,
        this.image,
        this.htmlText,
        this.active,
        this.priority,
        this.addedBy,
        this.addedDate});

  Data.fromJson(Map<String, dynamic> json) {
    bannerImageId = json['bannerImageId'];
    imageTitle = json['imageTitle'];
    image = json['image'];
    htmlText = json['htmlText'];
    active = json['active'];
    priority = json['priority'];
    addedBy = json['addedBy'];
    addedDate = json['addedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bannerImageId'] = this.bannerImageId;
    data['imageTitle'] = this.imageTitle;
    data['image'] = this.image;
    data['htmlText'] = this.htmlText;
    data['active'] = this.active;
    data['priority'] = this.priority;
    data['addedBy'] = this.addedBy;
    data['addedDate'] = this.addedDate;
    return data;
  }
}