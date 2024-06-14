class MainStatementItemModel {
  final String title;
  final double price;

  MainStatementItemModel(this.title, this.price);

  factory MainStatementItemModel.fromJson(Map<String, dynamic> json) {
    return MainStatementItemModel(json["title"], json["price"]);
  }

  static List<MainStatementItemModel> generates() {
    List<Map<String, dynamic>> data = [
      {
        "title": "Paie de réservation via profil ",
        "price": 1455.35,
      },
      {
        "title": "Service rapide",
        "price": 1455.35,
      },
      {
        "title": "Primes service rapide",
        "price": 1455.35,
      },
      {
        "title": "Travel work",
        "price": 1455.35,
      },
      {
        "title": "Pourboires",
        "price": 1455.35,
      }
    ];

    return data.map((item) => MainStatementItemModel.fromJson(item)).toList();
  }
}
