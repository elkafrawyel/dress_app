class AboutUsResponse {
  AboutUsResponse({
    this.data,
  });

  AboutUsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AboutUsModel.fromJson(v));
      });
    }
  }

  List<AboutUsModel>? data;
}

class AboutUsModel {
  AboutUsModel({
    this.title,
    this.titleAr,
    this.description,
    this.descriptionAr,
  });

  AboutUsModel.fromJson(dynamic json) {
    title = json['title'];
    titleAr = json['title_ar'];
    description = json['description'];
    descriptionAr = json['description_ar'];
  }

  String? title;
  String? titleAr;
  String? description;
  String? descriptionAr;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['title_ar'] = title;
    map['description'] = description;
    map['description_ar'] = descriptionAr;
    return map;
  }
}
