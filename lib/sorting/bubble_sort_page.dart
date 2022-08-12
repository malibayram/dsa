import 'package:flutter/material.dart';

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({super.key});

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
  var arr = [12, 5, 625, 12, 65, 756, 12, 76, 3, 23, 7, 8];
  var bubbleIndex = <int>[];

  void reset() {
    arr = [12, 5, 625, 12, 65, 756, 12, 76, 3, 23, 7, 8];
    bubbleIndex = <int>[];

    setState(() {});
  }

  Future<void> bubbleSort() async {
    for (int i = 0; i < arr.length; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
          bubbleIndex = <int>[j, j + 1];
          setState(() {});
          await Future.delayed(const Duration(milliseconds: 1200));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buble Sort")),
      body: Column(
        children: [
          TextButton(
            onPressed: bubbleSort,
            child: const Text("Sort"),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: reset,
            child: const Text("Reset"),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              for (int i = 0; i < arr.length; i++)
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Center(
                      child: Text(
                        arr[i].toString(),
                        style: TextStyle(
                          color: bubbleIndex.contains(i)
                              ? Colors.red
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              const VerticalDivider(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final item in bubbleIndex)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    arr[item].toString(),
                    style: const TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
