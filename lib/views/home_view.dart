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
      backgroundColor: Color.fromARGB(255, 255, 107, 107),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 370,
              child: FortuneWheel(
                selected: selected.stream,
                indicators: [
                  FortuneIndicator(
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(
                        color: Color.fromARGB(255, 26, 83, 92),
                      ))
                ],
                animateFirst: false,
                items: [
                  for (int i = 0;
                      i < widget.items.length;
                      i++) ...<FortuneItem>{
                    FortuneItem(
                        child: Text(
                          widget.items[i].toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 26, 83, 92),
                              fontWeight: FontWeight.bold),
                        ),
                        style: FortuneItemStyle(
                            color: Color.fromARGB(255, 255, 231, 109),
                            borderColor: Color.fromARGB(255, 247, 255, 248),
                            borderWidth: 5)),
                  },
                ],
                onAnimationEnd: () {
                  setState(() {
                    //rewards = items[selected.value];
                  });
                  print(rewards);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          "Bugünün harika geçeceği şimdiden belli oldu" +
                              rewards.toString() +
                              " Points!"),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  selected.add(Fortune.randomInt(0, widget.items.length));
                });
              },
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        width: 3, color: Color.fromARGB(255, 247, 255, 248)),
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 231, 109)),
                height: 40,
                width: 120,
                child: Center(
                  child: Text(
                    "Çarkı Çevir",
                    style: TextStyle(color: Color.fromARGB(255, 26, 83, 92)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
