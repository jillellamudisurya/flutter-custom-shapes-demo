import 'package:flutter/material.dart';
import 'package:flutter_paint_demo/variations/basic_variations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Paint Demo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BasicVariations(),
                      ),
                    );
                  },
                  child: const Text("Basic Variations",
                      style: TextStyle(fontSize: 20))),
            ],
          ),
        ));
  }
}
