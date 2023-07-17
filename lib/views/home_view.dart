import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class HomeView extends StatefulWidget {
  final List<String> items;
  const HomeView({Key? key, required this.items}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              child: FortuneWheel(
                selected: selected.stream,
                indicators: [
                  FortuneIndicator(
                    alignment: Alignment.topCenter,
                    child: TriangleIndicator(
                    color: Colors.black,
                  ))
                ],
                animateFirst: false,
                items: [
                  for(int i = 0; i < widget.items.length; i++)...<FortuneItem>{
                    FortuneItem(
                      child: Text(widget.items[i].toString() , style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold),),
                      style: FortuneItemStyle(
                        color: Colors.greenAccent,
                        borderColor: Colors.white,
                        borderWidth: 3
                        )
                    ),
                  },
                ],
                onAnimationEnd: () {
                  setState(() {
                   //rewards = items[selected.value];
                  });
                  print(rewards);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Bugünün harika geçeceği şimdiden belli oldu" + rewards.toString() + " Points!"),
                    ),
                  );
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                
              },
              child: Container(
                height: 40,
                width: 120,
                color: Colors.redAccent,
                child: Center(
                  child: Text("SPIN"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}