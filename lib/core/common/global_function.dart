// A function made for search container
List<String> searchFunction(String word) {
  List<String> searchList = [];
  String letter = " ";

  // To split the word into letters and join the letter with spaces
  String name = word.split("").join(" ");

  for (int j = 0; j < name.length; j++) {
    letter = letter + name[j];
    searchList.add(letter.toUpperCase());
    searchList.add(letter.toLowerCase());
  }
  return searchList;
}

// var data = await FirebaseFirestore.instance.collection(FirebaseConstants.adminUser).get();
// for(var a in data.docs){
//   FirebaseFirestore.instance.collection(FirebaseConstants.adminUser).doc(a.id).update({
//     'blocked' : false,
//     'blockReason' : ''
//   });
// }