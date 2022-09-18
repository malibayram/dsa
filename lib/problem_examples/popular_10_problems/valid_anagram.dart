/* 
Given two strings s1 and s2,
check if they're anagrams.
Two strings are anagrams if
they're made of the same
characters with the same
frequencies. 
*/

/* 
input:
sl= "danger"
s2 - = garden"
output: true
explanation:
"danger"
garden"
*/

void main(List<String> args) {
  print(isAnagram('danger', 'garden'));
}

bool isAnagram(String s1, String s2) {
  if (s1.length != s2.length) {
    return false;
  }
  final s1Map = <String, int>{};
  final s2Map = <String, int>{};
  for (int i = 0; i < s1.length; i++) {
    s1Map[s1[i]] = s1Map[s1[i]] == null ? 1 : s1Map[s1[i]]! + 1;
    s2Map[s2[i]] = s2Map[s2[i]] == null ? 1 : s2Map[s2[i]]! + 1;
  }
  for (int i = 0; i < s1.length; i++) {
    if (s1Map[s1[i]] != s2Map[s1[i]]) {
      return false;
    }
  }
  return true;
}
