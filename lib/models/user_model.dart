class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipcode: json['zipcode']);
  }
}

class Company {
  final String name;
  Company({required this.name});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(name: json['name']);
  }
}

class User {
  final int id;
  final String name;
  final String email;
  final String phone;
  final Address address;
  final Company company;

  User(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: Address.fromJson(json['address']),
      company: Company.fromJson(json['company']),
    );
  }
}
