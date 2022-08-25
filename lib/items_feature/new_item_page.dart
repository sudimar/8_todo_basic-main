import 'package:flutter/material.dart';
import 'package:todo_app/models/item_model.dart';

import '../widgets/item_button.dart';

class NewItemPage extends StatefulWidget {
  const NewItemPage({Key? key}) : super(key: key);

  @override
  State<NewItemPage> createState() => _NewItemPageState();
}

class _NewItemPageState extends State<NewItemPage> {
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('New Item'),
        ),
        backgroundColor: Colors.grey,
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _title,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      maxLines: 5,
                      controller: _description,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TextField(
                      controller: _date,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ItemButton(
                  title: 'Save',
                  onItemPressed: () {
                    /// This is a basic validation to check whether the
                    /// `TextField` has inputs from the user.
                    if (_title.text.isNotEmpty &&
                        _description.text.isNotEmpty &&
                        _date.text.isNotEmpty) {
                      Navigator.pop(
                        context,

                        /// This is where you pass the a `dynamic`
                        /// item.
                        ItemModel(
                          title: _title.text,
                          description: _description.text,
                          date: _date.text,
                        ),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
