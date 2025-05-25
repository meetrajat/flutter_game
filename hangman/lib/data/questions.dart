class Question {
  final String word;
  final String category;
  final String hint;

  Question({required this.word, required this.category, required this.hint});
}

final List<Question> indianQuestions = [
  Question(
    word: "TAJMAHAL",
    category: "Monuments",
    hint: "One of the Seven Wonders of the World in Agra"
  ),
  Question(
    word: "DIWALI",
    category: "Festivals",
    hint: "Festival of lights"
  ),
  Question(word: "MUMBAI", category: "Cities", hint: "Financial capital of India"),
  Question(word: "GANDHI", category: "Personalities", hint: "Father of the Nation"),
  Question(word: "KERALA", category: "States", hint: "God's own country"),
  Question(word: "CRICKET", category: "Sports", hint: "Most popular sport in India"),
  Question(word: "DELHI", category: "Cities", hint: "Capital of India"),
  Question(word: "HOLI", category: "Festivals", hint: "Festival of colors"),
  Question(word: "YOGA", category: "Culture", hint: "Ancient Indian practice for mind and body"),
  // Add more questions here...
];
