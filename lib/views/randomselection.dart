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
        }
        else if (settings.name == '/home') {
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
        title: Text('Input List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              decoration: InputDecoration(
                labelText: 'Değer girin',
              ),
            ),
            ElevatedButton(
              onPressed: _addItemToList,
              child: Text('Ekle'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home', arguments: _items);
              },
              child: Text('Listeyi Göster'),
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
