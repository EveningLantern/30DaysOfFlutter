import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store_basics/core/store.dart';
import 'package:online_store_basics/models/cart.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    required this.catalog,
  });

  final cart = CartModel();
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;

    bool isIncart = cart.items.contains(catalog);
    return ElevatedButton(
      onPressed: () {
        if (!isIncart) {
          AddMutation(catalog);
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
