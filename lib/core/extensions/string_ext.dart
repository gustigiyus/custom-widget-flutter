extension StringExt on String {
  /// hello_world = Hello World
  String get toTitleCase {
    // Split string by underscores
    List<String> words = split('_');

    // Capitalize the first letter of each word and make the rest lowercase
    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).toList();

    // Join words with space
    return capitalizedWords.join(' ');
  }
}
