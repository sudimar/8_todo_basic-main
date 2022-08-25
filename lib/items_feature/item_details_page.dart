import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:todo_app/widgets/item_button.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemModel itemModel;

  const ItemDetailsPage({
    super.key,
    required this.itemModel,
  });

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.itemModel.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.itemModel.description),
                  Text(widget.itemModel.date),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ItemButton(
                      title: 'Edit',
                      color: Colors.blue,
                      onItemPressed: () {},
                    ),
                    ItemButton(
                      title: 'Delete',
                      color: Colors.red,
                      onItemPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
