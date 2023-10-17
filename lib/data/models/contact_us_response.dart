class ContactUsResponse {
  ContactUsResponse({
    this.data,
  });

  ContactUsResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(ContactUsModel.fromJson(v));
      });
    }
  }

  List<ContactUsModel>? data;
}

class ContactUsModel {
  ContactUsModel({
    this.title,
    this.facebook,
    this.instagram,
    this.twitter,
    this.address,
    this.addressAr,
    this.phone,
  });

  ContactUsModel.fromJson(dynamic json) {
    title = json['title'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    twitter = json['twitter'];
    address = json['address'];
    addressAr = json['address_ar'];
    phone = json['phone'];
  }

  String? title;
  String? facebook;
  String? instagram;
  String? twitter;
  String? address;
  String? addressAr;
  String? phone;
}
