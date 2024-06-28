import 'package:flutter/material.dart';
import 'package:online_store_basics/models/catalog.dart';
import 'package:online_store_basics/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        //padding: const EdgeInsets.only(bottom: 20.0),
        color: MyTheme.softvioletColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.white.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    MyTheme.deepvioletColor,
                  ),
                  shape: WidgetStateProperty.all(
                    const StadiumBorder(),
                  )),
              child: "Buy".text.xl2.white.semiBold.make(),
            ).wh(100, 50)
          ],
        ).p32(),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: Navigator.of(context).pop,
          icon: const Icon(
            Icons.arrow_back,
            color: MyTheme.softvioletColor,
          ),
        ),
        backgroundColor: MyTheme.creamColor,
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            children: [
              Hero(
                      tag: Key(catalog.id.toString()),
                      child: Image.network(catalog.image))
                  .h32(context),
              Expanded(
                child: VxArc(
                    arcType: VxArcType.convey,
                    edge: VxEdge.top,
                    height: 30.0,
                    child: Container(
                      width: context.screenWidth,
                      color: MyTheme.creamColor,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(MyTheme.softvioletColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                        ],
                      ).py64(),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
