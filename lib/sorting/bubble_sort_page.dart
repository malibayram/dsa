import 'package:flutter/material.dart';

class BubbleSortPage extends StatefulWidget {
  const BubbleSortPage({super.key});

  @override
  State<BubbleSortPage> createState() => _BubbleSortPageState();
}

class _BubbleSortPageState extends State<BubbleSortPage> {
  var arr = [12, 5, 625, 12, 65, 756, 12, 76, 3, 23, 7, 8];
  var compareIndex = <int>[];

  void reset() {
    arr = [12, 5, 625, 12, 65, 756, 12, 76, 3, 23, 7, 8];
    compareIndex = <int>[];

    setState(() {});
  }

  Future<void> bubbleSort() async {
    for (int i = 0; i < arr.length; i++) {
      for (int j = 0; j < arr.length - i - 1; j++) {
        compareIndex = <int>[j, j + 1];

        if (arr[j] > arr[j + 1]) {
          int temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        }

        setState(() {});
        await Future.delayed(const Duration(milliseconds: 600));
      }
    }
  }

  Future<void> selectionSort() async {
    for (int i = 0; i < arr.length - 1; i++) {
      for (int j = i + 1; j < arr.length; j++) {
        compareIndex = <int>[i, j];

        if (arr[j] < arr[i]) {
          int temp = arr[j];
          arr[j] = arr[i];
          arr[i] = temp;
        }

        setState(() {});
        await Future.delayed(const Duration(milliseconds: 1200));
      }
    }
  }

  Future<void> insertionSort() async {
    late int key, j;
    for (int i = 1; i < arr.length; i++) {
      key = arr[i];
      j = i - 1;

      while (j >= 0 && arr[j] > key) {
        compareIndex = <int>[i, j];

        arr[j + 1] = arr[j];
        j = j - 1;

        setState(() {});
        await Future.delayed(const Duration(milliseconds: 1200));
      }

      arr[j + 1] = key;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sorting Page")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: bubbleSort,
                child: const Text("Bubble Sort"),
              ),
              const VerticalDivider(),
              TextButton(
                onPressed: selectionSort,
                child: const Text("Selection Sort"),
              ),
              const VerticalDivider(),
              TextButton(
                onPressed: insertionSort,
                child: const Text("Insertion Sort"),
              ),
            ],
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
                          color: compareIndex.contains(i)
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
              for (final item in compareIndex)
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
