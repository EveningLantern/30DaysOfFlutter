import 'package:flutter/material.dart';
import 'package:online_store_basics/models/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("${item.name}pressed");
        },
        titleTextStyle: const TextStyle(color: Color(0xff6C63FF), fontSize: 20),
        leading: Image.network(item.image),
        title: Text(
          item.name,
        ),
        subtitle: Text(item.desc),
        trailing: Text(
          "\$${item.price.toStringAsFixed(2)}",
        ),
      ),
    );
  }
}
