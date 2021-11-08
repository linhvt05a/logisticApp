class Note {
  //modal class for Person object
  final int? id;
  final String title;
  final String amount;
  final String createAt;
  final int isComplete;

  Note({
    this.id,
    required this.title,
    required this.amount,
    required this.createAt,
    required this.isComplete,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'createAt': createAt,
      'isComplete': isComplete,
    };
  }

  @override
  String toString() {
    return '{id: $id, title: $title, amount: $amount,createAt: $createAt,isComplete: $isComplete}';
  }
}
