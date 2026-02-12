class GoldModel {
  final String name;
  final double price;
  final String symbol;
  final String updatedAt;
  final String updatedAtReadable;
  GoldModel({
    required this.name,
    required this.price,
    required this.symbol,
    required this.updatedAt,
    required this.updatedAtReadable,
  });

  factory GoldModel.fromJson(Map<String, dynamic> json) {
    return GoldModel(
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      symbol: json['symbol'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      updatedAtReadable: json['updatedAtReadable'] ?? '',
    );
  }
}
