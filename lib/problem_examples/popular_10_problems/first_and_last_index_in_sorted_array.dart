/* 
Given a sorted array of
integers arr and an integer
target, find the index of the
first and last position of
target in arr. In target can't be
found in arr, return [-1, -1].
 */

/* 
input: arr = [2, 4, 5, 5, 5, 5, 5, 7, 9, 9];
target = 5
output: [2, 6]
 */
void main(List<String> args) {
  print(firstAndLastIndex([2, 4, 5, 5, 5, 5, 5, 7, 9, 9], 0));
}

List<int> firstAndLastIndex(List<int> arr, int target) {
  final result = <int>[];
  int i = 0;
  /* for (; i < arr.length; i++) {
    if (arr[i] == target) {
      result.add(i);
      break;
    }
  }
  for (; i < arr.length; i++) {
    if (arr[i] != target) {
      result.add(i - 1);
      break;
    }
  } */

  int left = 0;
  int right = arr.length - 1;
  int mid = 0;

  while (left <= right) {
    i++;
    mid = (left + right) ~/ 2;
    if (arr[mid] == target) {
      break;
    } else if (arr[mid] > target) {
      right = mid - 1;
    } else {
      left = mid + 1;
    }
  }
  print("i: $i");

  if (arr[mid] != target) {
    return [-1, -1];
  }

  int leftIndex = mid;
  int rightIndex = mid;
  while (leftIndex >= 0 && arr[leftIndex] == target) {
    leftIndex--;
    i++;
  }
  while (rightIndex < arr.length && arr[rightIndex] == target) {
    rightIndex++;
    i++;
  }
  result.add(leftIndex + 1);
  result.add(rightIndex - 1);

  print("i: $i");

  if (result.isEmpty) {
    return [-1, -1];
  }

  return result;
}
