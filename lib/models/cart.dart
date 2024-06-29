import 'package:online_store_basics/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  // collection of Ids - stores Ids of each items
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get items in the cart
  Iterable get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get Total Price
  num get TotalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // add item
  void add(Item item) {
    _itemIds.add(item.id.toInt());
  }

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id.toInt());
  }
}
