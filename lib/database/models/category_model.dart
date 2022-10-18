import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String title;
  String imgUrl;
  String description;
  String email;
  List<ContactsModel>? contacts;

  CategoryModel({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.description,
    required this.email,
    required this.contacts,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imgUrl = json['imgUrl'] as String,
        description = json['description'] as String,
        email = json['email'] as String,
        contacts = (json['contacts'] as List)
            .map((dynamic e) =>
                ContactsModel.fromJson(e as Map<String, dynamic>))
            .toList();
  CategoryModel.fromSnapshot(DocumentSnapshot json)
      : id = json.id,
        title = json['title'],
        imgUrl = json['imgUrl'],
        description = json['description'],
        email = json['email'],
        contacts = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['email'] = email;
    data['email'] = imgUrl;
    return data;
  }
}

class ContactsModel {
  String id;
  String employeeid;
  String imageUrl;
  String name;
  String empEmail;
  String? empContact;

  ContactsModel({
    required this.id,
    required this.employeeid,
    required this.imageUrl,
    required this.name,
    required this.empEmail,
    this.empContact,
  });

  ContactsModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        employeeid = json['employeeid'],
        imageUrl = json['image_url'],
        name = json['name'] as String,
        empEmail = json['emp_email'],
        empContact = json['emp_contact'];

  //   ContactsModel.fromSnapshot(Map<String, dynamic> json)
  // : id = json['id'],
  //   employeeid = json['employeeid'],
  //   imageUrl = json['imageUrl'],
  //   empEmail = json['empEmail'],
  //   empContact = json['empContact'],
  //   name = json['name'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['employeeid'] = employeeid;
    data['name'] = name;
    data['empEmail'] = empEmail;
    data['imageUrl'] = imageUrl;
    data['empContact'] = empContact;
    return data;
  }
}
