import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  String email;
  List<ContactsModel>? contacts;

  CategoryModel({
    required this.id ,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.email,
    this.contacts,
  });

  CategoryModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        description = json['Description'] as String,
        email = json['email'] as String,
        contacts = (json['contacts'] as List)
            .map((dynamic e) =>
                ContactsModel.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['Description'] = this.description;
    data['email'] = this.email;

    return data;
  }

  static fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> category) {}
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
      : id = json['id'] as String,
        employeeid = json['employeeid'] as String,
        imageUrl = json['image_url'] as String,
        name = json['name'] as String,
        empEmail = json['emp_email'] as String,
        empContact = json['emp_contact'] as String;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeid'] = this.employeeid;
    data['image_url'] = this.imageUrl;
    data['name'] = this.name;
    data['emp_email'] = this.empEmail;
    data['emp_contact'] = this.empContact;
    return data;
  }
}
