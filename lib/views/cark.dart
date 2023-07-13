import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(WheelApp());

class WheelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wheel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WheelScreen(),
    );
  }
}

class WheelScreen extends StatefulWidget {
  @override
  _WheelScreenState createState() => _WheelScreenState();
}

class _WheelScreenState extends State<WheelScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _textFieldController = TextEditingController();
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Timer _timer;
  List<String> _items = [];
  bool _isSpinning = false;
  late int _selectedItemIndex;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOut);
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSpinning = false;
        });
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Sonuç'),
              content: Text('Seçilen öğe: ${_items[_selectedItemIndex]}'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void _spinWheel() {
    if (_items.isNotEmpty && !_isSpinning) {
      Random random = Random();
      int randomIndex = random.nextInt(_items.length);
      double randomFraction = random.nextDouble() * 2 + 4; // 4-6 arası rastgele bir hız belirler
      double stopPosition =
          (randomIndex + 1 / 2) * (360 / _items.length); // Hedef durağan pozisyonu hesaplar
      _selectedItemIndex = randomIndex;
      _animationController.duration = Duration(seconds: randomFraction.toInt());
      _animation = Tween<double>(
        begin: 0,
        end: stopPosition + 720, // 720 derece eklenir, çünkü çark en az 2 tam tur dönecek
      ).animate(_animationController);
      setState(() {
        _isSpinning = true;
      });
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wheel'),
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
                onPressed: () {
                  setState(() {
                    _items = _textFieldController.text.split(',');
                  });
                },
                child: Text('Listeyi Güncelle'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _spinWheel,
                child: Text('Döndür'),
              ),
              SizedBox(height: 16.0),
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _animation.value * pi / 180, // Dereceyi radyana çevirir
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: Image.asset('assets/wheel.png'),
                      ),
                    ),
                  );
                },
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
    _animationController.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
    super.dispose();
  }
}
