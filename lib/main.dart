import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

//*->Controller: bộ điều khiển
class Counter extends GetxController {
  RxInt count = 0.obs;

  void add() {
    count++;
  }
}

//*->Screen: HomeScrren
class Home extends StatelessWidget {
  final counter = Get.put(Counter());
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  '${counter.count}',
                  style: const TextStyle(
                    fontSize: 40,
                    color: Colors.red,
                  ),
                )),
            ElevatedButton(
              onPressed: () {
                Get.to(NextScrren());
              },
              child: const Text('Next Screen'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(TechNio());
              },
              child: const Text('Tech Nio'),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NextScrren extends StatelessWidget {
  final Counter counters = Get.find();
  NextScrren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Next Scrren'),
      ),
      body: Center(
        child: Obx(
          () => Text(
            '${counters.count}',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counters.add();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TechNio extends StatelessWidget {
  const TechNio({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Get.snackbar(
                'Hi',
                'Hi Hi ',
                colorText: Colors.orange,
              );
            },
            child: const Text('Show Snackbar'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Back'),
          )
        ],
      ),
    );
  }
}
