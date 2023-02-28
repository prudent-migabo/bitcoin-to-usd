class Model {
  int desiredUsdValue;

//<editor-fold desc="Data Methods">
  Model({
    required this.desiredUsdValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'desiredUsdValue': desiredUsdValue,
    };
  }

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      desiredUsdValue: json['market_data']['current_price']['usd'],
    );
  }


//</editor-fold>
}