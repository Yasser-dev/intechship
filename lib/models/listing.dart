import 'dart:convert';

import 'company.dart';

class Listing {
  String id;
  Company company;
  String positionTitle;
  int duration;
  String startingDate;
  bool isPaid;
  bool isRemote;
  int salary;
  String roleDescription;
  int numberOfOpenings;

  Listing({
    this.id,
    this.company,
    this.positionTitle,
    this.duration,
    this.startingDate,
    this.isPaid,
    this.isRemote,
    this.salary,
    this.roleDescription,
    this.numberOfOpenings,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'company': company?.toMap(),
      'positionTitle': positionTitle,
      'duration': duration,
      'startingDate': startingDate,
      'isPaid': isPaid,
      'isRemote': isRemote,
      'salary': salary,
      'roleDescription': roleDescription,
      'numberOfOpenings': numberOfOpenings,
    };
  }

  factory Listing.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Listing(
      company: Company.fromMap(map['company']),
      positionTitle: map['positionTitle'],
      duration: map['duration'],
      startingDate: map['startingDate'],
      isPaid: map['isPaid'],
      isRemote: map['isRemote'],
      salary: map['salary'],
      roleDescription: map['roleDescription'],
      numberOfOpenings: map['numberOfOpenings'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Listing.fromJson(String source) =>
      Listing.fromMap(json.decode(source));

  Listing copyWith({
    String id,
    Company company,
    String positionTitle,
    int duration,
    String startingDate,
    bool isPaid,
    bool isRemote,
    int salary,
    String roleDescription,
    int numberOfOpenings,
  }) {
    return Listing(
      id: id ?? this.id,
      company: company ?? this.company,
      positionTitle: positionTitle ?? this.positionTitle,
      duration: duration ?? this.duration,
      startingDate: startingDate ?? this.startingDate,
      isPaid: isPaid ?? this.isPaid,
      isRemote: isRemote ?? this.isRemote,
      salary: salary ?? this.salary,
      roleDescription: roleDescription ?? this.roleDescription,
      numberOfOpenings: numberOfOpenings ?? this.numberOfOpenings,
    );
  }
}
