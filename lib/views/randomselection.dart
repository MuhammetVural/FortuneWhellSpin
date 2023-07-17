import 'package:flutter/material.dart';
import 'package:spin_well_fortune/views/home_view.dart';

void main() => runApp(InputListApp());

class InputListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => InputListScreen(),
          );
        } else if (settings.name == '/list') {
          final List<String> items = settings.arguments as List<String>;
          return MaterialPageRoute(
            builder: (context) => ListScreen(items: items),
          );
        } else if (settings.name == '/home') {
          final List<String> items = settings.arguments as List<String>;
          return MaterialPageRoute(
            builder: (context) => HomeView(items: items),
          );
        }
        return null;
      },
    );
  }
}

class InputListScreen extends StatefulWidget {
  @override
  _InputListScreenState createState() => _InputListScreenState();
}

class _InputListScreenState extends State<InputListScreen> {
  final TextEditingController _inputController = TextEditingController();
  List<String> _items = [];

  void _addItemToList() {
    setState(() {
      _items.add(_inputController.text);
      _inputController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Çarka Hoş geldiniz'),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 255, 107, 107),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            TextFormField(
              showCursor: true,
              onChanged: (val) {},
              controller: _inputController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Çevirmeden Önce Seçenekleri Ekleyin",
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 26, 83, 92),
                      fontWeight: FontWeight.normal),
                  floatingLabelAlignment: FloatingLabelAlignment.start,
                  floatingLabelStyle: TextStyle(
                      color: Color.fromARGB(255, 26, 83, 92),
                      fontWeight: FontWeight.bold),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 107, 107), width: 5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 255, 107, 107), width: 5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Color.fromARGB(255, 77, 205, 196), width: 5),
                  ),
                  contentPadding: EdgeInsets.all(20),
                  hoverColor: Colors.red,
                  fillColor: Colors.purple),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _addItemToList();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 107, 107)),
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Ekle",
                        style: TextStyle(
                            color: Color.fromARGB(255, 26, 83, 92),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home', arguments: _items);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 255, 107, 107)),
                    height: 40,
                    width: 120,
                    child: Center(
                      child: Text(
                        "Çarka Git",
                        style: TextStyle(
                            color: Color.fromARGB(255, 26, 83, 92),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }
}

class ListScreen extends StatelessWidget {
  final List<String> items;

  ListScreen({required this.items});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
          );
        },
      ),
    );
  }
}
