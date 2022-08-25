import 'package:flutter/material.dart';
import 'package:todo_app/items_feature/item_details_page.dart';
import 'package:todo_app/models/item_model.dart';
import 'package:todo_app/widgets/item_button.dart';
import 'package:todo_app/widgets/todo_item.dart';

import '../items_feature/new_item_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Previously, we use a `List` of `String`.
  /// This time, we're using a list of `ItemModel`.
  /// `ItemModel` is a Dart object class we created.
  List<ItemModel> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sulu Buying Center'),
      ),
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber
            ),

          ),
          Container(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      for (int i = 0; i < todoItems.length; i++)
                        TodoItem(
                          title: todoItems[i].title,
                          description: todoItems[i].description,
                          date: todoItems[i].date,
                          onItemPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) {
                                return ItemDetailsPage(
                                  itemModel: todoItems[i],
                                );
                              }),
                            );
                          },
                        )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ItemButton(
                    title: 'New Item',
                    color: Colors.green,
                    onItemPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return const NewItemPage();
                        }),
                      ).then((value) {
                        /// This checks if the value from the
                        /// previous route is an instance of
                        /// `ItemModel`. If so, read
                        /// the value accordingly.
                        if (value is ItemModel) {
                          /// `setState` notifies the Flutter
                          /// to rebuild the UI
                          setState(() {
                            todoItems.add(value);
                          });
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
