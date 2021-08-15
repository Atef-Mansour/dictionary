import 'package:flutter/material.dart';
import './element.dart';
import 'package:intl/intl.dart';
import './bottom_sheet_widegte.dart';


class ElementListScreen extends StatefulWidget {
  const ElementListScreen({Key? key}) : super(key: key);

  @override
  _ElementListScreenState createState() => _ElementListScreenState();
}

class _ElementListScreenState extends State<ElementListScreen> {
  @override
  List<ElementDic> elementList = [
    ElementDic('1', 'Welcome', 'أهلا وسهلا'),
    ElementDic('2', 'Book', 'كتاب'),
    ElementDic('3', 'Pen', 'قلم حبر'),
    ElementDic('4', 'dictionary', 'قاموس مفردات'),
  ];
  void addElementDic(String id, String word1, String word2) {
    setState(() {
      elementList.add(ElementDic(id, word1, word2));
    });
  }

  Widget build(BuildContext context) {
    void removeItem(String id) =>
        elementList.removeWhere((element) => element.id == id);
    void openSheet() {
      showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return BottomSheetWidegt(addElementDic);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Dictionary - القاموس'),
      ),
      body: elementList.length == 0
          ? Center(
              child: Image.asset('asset/waiting.png'),
            )
          : ListView.builder(
              itemCount: elementList.length,
              itemBuilder: (ctx, index) {
                return ListTile(

                  title: Text(elementList[index].word1),
                  subtitle: Text(elementList[index].word2),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        removeItem(elementList[index].id);
                      });
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        onPressed: openSheet,
        child: Icon(Icons.add),
      ),
    );
  }
}
