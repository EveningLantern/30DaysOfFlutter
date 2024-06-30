import 'package:online_store_basics/core/store.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  // collection of Ids - stores Ids of each items
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get items in the cart
  Iterable get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // get Total Price
  num get TotalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // remove item
  void remove(Item item) {
    _itemIds.remove(item.id.toInt());
  }
}

class AddMutation extends VxMutation<MyStore> {
  late final Item item;

  AddMutation(Item catalog);
  @override
  perform() {
    store?.cart._itemIds.add(item.id.toInt());
  }
}
