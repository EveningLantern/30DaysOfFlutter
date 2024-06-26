class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "iphone 12 pro",
        desc: "Apple phone 12th gen",
        price: 999,
        color: "#E7355E",
        image:
            "https://i5.walmartimages.com/asr/199ab764-f112-4508-888c-86a1094624e8.17daf90b726900a539a8b9873fdea1f5.jpeg")
  ];
}

class Item {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}
