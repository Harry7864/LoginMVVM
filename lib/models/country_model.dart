class Country {
  final String name;
  final String flagUrl;
  final String currency;

  Country({required this.name, required this.flagUrl, required this.currency});
  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      name: json['name'] as String,
      flagUrl: json['flag'] as String,
      currency: json['currency'] as String,
    );
  }
  Country fromMap(Map<String, dynamic> map) => Country(
      name: map['name'], flagUrl: map['flagUrl'], currency: map['currency']);

  Country toMap() => Country(name: name, flagUrl: flagUrl, currency: currency);
}

