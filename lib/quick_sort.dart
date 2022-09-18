import 'package:flutter/material.dart';

class QuickSort extends ChangeNotifier {
  late List<int> list;

  List<int> quickSort(List<int> list) {
    this.list = list;
    notifyListeners();

    if (list.length <= 1) {
      notifyListeners();
      return list;
    }

    final pivot = list[0];
    final left = <int>[];
    final right = <int>[];

    for (int i = 1; i < list.length; i++) {
      if (list[i] < pivot) {
        left.add(list[i]);
      } else {
        right.add(list[i]);
      }
      notifyListeners();
    }

    return [
      ...(left.length <= 1 ? left : quickSort(left)),
      pivot,
      ...(right.length <= 1 ? right : quickSort(right)),
    ];
  }
}
