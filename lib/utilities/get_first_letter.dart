getFirstLetter(String name) {
  List<String> words = name.split(" ");
  words.forEach((word) => word.trim());
  return words[0][0] == null ? "" : words[0][0];
}
