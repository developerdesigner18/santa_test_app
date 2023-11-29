import 'package:get/get.dart';

class Child {
  final String name;
  final String country;
  bool isNaughty;

  Child({
    required this.name,
    required this.country,
    required this.isNaughty,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    name: json["name"],
    country: json["country"],
    isNaughty: json["isNaughty"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "isNaughty": isNaughty,
  };
}

List<Map<String, dynamic>> childrenDataList = [
  {
    'name': 'Tony',
    'country': 'India',
    'isNaughty': true,
  },
  {
    'name': 'Tony',
    'country': 'India',
    'isNaughty': true,
  },
  {
    'name': 'Tony',
    'country': 'India',
    'isNaughty': true,
  },
  {
    'name': 'Tony',
    'country': 'India',
    'isNaughty': true,
  },
];