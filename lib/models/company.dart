import 'dart:convert';

class Company {
  String name;
  String email;
  String location;
  String logoUrl;
  String websiteUrl;
  Company({
    this.name,
    this.email,
    this.location,
    this.logoUrl,
    this.websiteUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'location': location,
      'logoUrl': logoUrl,
      'websiteUrl': websiteUrl,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Company(
      name: map['name'],
      email: map['email'],
      location: map['location'],
      logoUrl: map['logoUrl'],
      websiteUrl: map['websiteUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source));
}
