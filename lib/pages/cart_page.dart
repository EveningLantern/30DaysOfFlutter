import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_store_basics/core/store.dart';
import 'package:online_store_basics/models/cart.dart';
import 'package:online_store_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: MyTheme.softvioletColor,
          ),
        ),
        title: "CART".text.color(context.theme.primaryColor).xl4.make(),
      ),
      body: Column(
        children: [
          const _CartList().p32().expand(),
          const Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal();

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: const {RemoveMutation},
            builder: (context, cart, mutations) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(context.theme.primaryColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(
                        context.theme.primaryColor,
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      )),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supported yet".text.make(),
                      behavior: SnackBarBehavior.floating,
                    ));
                  },
                  child:
                      "BUY".text.color(context.theme.primaryColorDark).make())
              .w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({super.key});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel cart = (VxState.store as MyStore).cart;
    return cart.items.isEmpty
        ? Icon(
            CupertinoIcons.cart,
            color: context.theme.primaryColor,
            size: 100.0,
          )
        //"Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutation(cart.items.elementAt(index)),
              ),
              title: cart.items.elementAt(index).name.toString().text.make(),
            ),
          );
  }
}
