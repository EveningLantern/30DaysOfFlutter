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
              child: "Add to Cart".text.xl2.white.semiBold.make(),
            ).wh(150, 50)
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
        backgroundColor: Colors.transparent,
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
                          "Sodales non eu blandit scelerisque a a pulvinar mauris quis vulputate ipsum a a parturient nisi ultrices a pharetra a eu himenaeos diam. Placerat scelerisque auctor augue turpis euismod ultricies odio vestibulum . Ut suspendisse eget gravida ultricies a dis mattis a libero nisi rhoncus ut ullamcorper volutpat a risus elementum vitae curae vehicula felis. Conubia accumsan metus posuere vestibulum ut mi venenatis potenti magna commodo in at at fringilla sed placerat ipsum et phasellus adipiscing vestibulum nibh quis sed vestibulum. Velit a quam duis risus rhoncus adipiscing primis luctus convallis inceptos iaculis adipiscing cras lectus posuere etiam."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                              .p16()
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
