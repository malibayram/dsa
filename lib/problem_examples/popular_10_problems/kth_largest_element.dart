/* 
Given an array of
integers arr and
an integer k, find
the kth largest
element
1 =< k =< |arr|
 */

/* 
input:
int max = 0;
arr = [4, 2, 9, 7, 5, 6, 7, 1, 3]
k = 5
output: 6
explanation:
]st largest element is 9
2nd largest element is 7
3rd largest element is 7
4th largest element is 6
 */
void main(List<String> args) {
  print(kthLargestElement([4, 2, 9, 7, 5, 6, 7, 1, 3], 4));
  print(quickSort([2, 4, 9, 7, 5, 6, 7, 1, 3]));
  // [2, 4, 7, 9, 5, 6, 7, 1, 3]
  // [2, 4, 5, 7, 9, 6, 7, 1, 3]
  // [2, 4, 5, 7, 9, 9, 7, 1, 3]
  // [2, 4, 5, 7, 7, 9, 7, 1, 3]
  // [2, 4, 5, 6, 7, 9, 7, 1, 3]
  // [2, 4, 5, 6, 7, 9, 9, 1, 3]
  // [2, 4, 5, 6, 7, 7, 9, 1, 3]
  // [2, 4, 5, 6, 7, 7, 9, 9, 3]
  // [2, 4, 5, 6, 7, 7, 7, 9, 3]
  // [2, 4, 5, 6, 7, 7, 7, 9, 3]
  // [2, 4, 5, 6, 6, 7, 7, 9, 3]
  // [2, 4, 5, 5, 6, 7, 7, 9, 3]
  // [2, 4, 4, 5, 6, 7, 7, 9, 3]
  // [2, 2, 4, 5, 6, 7, 7, 9, 3]
  // [1, 2, 4, 5, 6, 7, 7, 9, 3]
  print("k: $k");
  print("s: $s");
}

List<int> insertionSort(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int j = i - 1;
    int key = arr[i];
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

List<int> selectionSort(List<int> arr) {
  // O(n^2)
  for (int i = 0; i < arr.length; i++) {
    int min = i;
    for (int j = i + 1; j < arr.length; j++) {
      if (arr[j] < arr[min]) {
        min = j;
      }
    }
    final temp = arr[i];
    arr[i] = arr[min];
    arr[min] = temp;
  }
  return arr;
}

int kthLargestElement(List<int> arr, int k) {
  arr = quickSort(arr);
  return arr[arr.length - k];
  /* int temp = arr.last; 
  int count = 1;
  for (int i = arr.length - 1; i >= 0; i--) {
    if (arr[i] != temp) {
      count++;
      temp = arr[i];
    }
    if (count == k) {
      return temp;
    }
  } */
  /* final heap = Heap();
  for (int i = 0; i < arr.length; i++) {
    heap.insert(arr[i]);
  }
  int result = 0;
  for (int i = 0; i < k; i++) {
    result = heap.remove();
  }
  return result; */
}

int k = 0;
int s = 0;
List<int> quickSort(List<int> arr) {
  s++;
  if (arr.length <= 1) {
    k++;
    return arr;
  }
  final pivot = arr[0];
  final left = <int>[];
  final right = <int>[];
  for (int i = 1; i < arr.length; i++) {
    k++;
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else {
      right.add(arr[i]);
    }
  }
  return [
    ...(left.length <= 1 ? left : quickSort(left)),
    pivot,
    ...(right.length <= 1 ? right : quickSort(right)),
  ];
}
/* 
[2, 4, 9, 7, 5, 6, 7, 1, 3]
[1, 2, 4, 9, 7, 5, 6, 7, 3]
[1, 2, 3, 4, 9, 7, 5, 6, 7]
[1, 2, 3, 4, 7, 5, 6, 7, 9]
[1, 2, 3, 4, 5, 6, 7, 7, 9]
 */