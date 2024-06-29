import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store_basics/models/cart.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({
    required this.catalog,
  });

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isIncart = cart.items.contains(widget.catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isIncart) {
          isIncart = isIncart.toggle();
          final catalog = CatalogModel();

          cart.catalog = catalog;
          cart.add(widget.catalog);

          setState(() {});
        }
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            context.theme.primaryColor,
          ),
          shape: WidgetStateProperty.all(
            const StadiumBorder(),
          )),
      child: isIncart
          ? Icon(
              CupertinoIcons.checkmark_seal_fill,
              color: context.theme.primaryColorDark,
            )
          : Icon(
              CupertinoIcons.cart_fill_badge_plus,
              color: context.theme.primaryColorDark,
            ),
    );
  }
}
