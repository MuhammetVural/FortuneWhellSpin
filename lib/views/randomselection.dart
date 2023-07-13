import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(RandomSelectionApp());

class RandomSelectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Selection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomSelectionScreen(),
    );
  }
}

class RandomSelectionScreen extends StatefulWidget {
  @override
  _RandomSelectionScreenState createState() => _RandomSelectionScreenState();
}

class _RandomSelectionScreenState extends State<RandomSelectionScreen> {
  final TextEditingController _textFieldController = TextEditingController();
  String _selectedItem = '';

  void _selectRandomItem() {
    List<String> items = _textFieldController.text.split(',');
    if (items.isNotEmpty) {
      Random random = Random();
      int randomIndex = random.nextInt(items.length);
      setState(() {
        _selectedItem = items[randomIndex];
      });
    } else {
      setState(() {
        _selectedItem = 'Veri girilmedi.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Selection'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _textFieldController,
                decoration: InputDecoration(
                  hintText: 'Öğeleri virgülle ayırarak girin',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _selectRandomItem,
                child: Text('Rastgele Seç'),
              ),
              SizedBox(height: 16.0),
              Text(
                'Seçilen Öğe:',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                _selectedItem,
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }
}
