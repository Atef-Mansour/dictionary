import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BottomSheetWidegt extends StatefulWidget {
  final Function(String id, String word1, String word2) addItem;
  const BottomSheetWidegt(this.addItem, {Key? key}) : super(key: key);

  @override
  _BottomSheetWidegtState createState() => _BottomSheetWidegtState();
}

class _BottomSheetWidegtState extends State<BottomSheetWidegt> {
  DateTime? _selectedDate;
  var _word1Controller = TextEditingController();
  var _word2Controller = TextEditingController();
//  void openDatePaker() {
//    showDatePicker(
//      context: context,
//      initialDate: DateTime.now(),
//      firstDate: DateTime(2010),
//      lastDate: DateTime.now(),
//    ).then((value) {
//      setState(() {
//        _selectedDate = value;
//      });
//    });
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _word1Controller,
                decoration:
                    InputDecoration(labelText: 'English Word', hintText: 'Example'),
                keyboardType: TextInputType.text,
              ),
              TextField(
                controller: _word2Controller,
                decoration:
                    InputDecoration(labelText: 'Arabic Word', hintText: 'مثال'),
                keyboardType: TextInputType.name,
              ),

              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    widget.addItem(
                        DateTime.now().toString(),
                        _word1Controller.text,
                        _word2Controller.text);


                  },
                  child: Text('Add ُ Element'))
            ],
          ),
        ),
      ),
    );
  }
}
