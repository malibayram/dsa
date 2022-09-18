import 'package:dsa/quick_sort.dart';
import 'package:flutter/material.dart';

class QuickSortPage extends StatefulWidget {
  const QuickSortPage({super.key});

  @override
  State<QuickSortPage> createState() => _QuickSortPageState();
}

class _QuickSortPageState extends State<QuickSortPage> {
  final quickSort = QuickSort();

  @override
  void initState() {
    quickSort.addListener(() {
      setState(() {});
    });
    quickSort.quickSort([4, 3, 5, 2, 1, 8, 6, 7]);

    super.initState();
  }

  @override
  void dispose() {
    quickSort.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quick Sort Page')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Quick Sort'),
            for (final item in quickSort.list)
              Container(
                width: 10,
                height: 50.0 * item,
                color: Colors.blue,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Center(child: Text(item.toString())),
              ),
            Text('${quickSort.list}'),
          ],
        ),
      ),
    );
  }
}
