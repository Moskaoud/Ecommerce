class Address {
  final String id;
  final String streetAddress;
  final String city;
  final String state;
  final String zipCode;

  Address({
    required this.id,
    required this.streetAddress,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  factory Address.fromMap(Map<String, dynamic> data, String id) {
    return Address(
      id: id,
      streetAddress: data['streetAddress'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      zipCode: data['zipCode'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streetAddress': streetAddress,
      'city': city,
      'state': state,
      'zipCode': zipCode,
    };
  }
}
