class Subject {
  final int id;
  final String title;
  final String description;

  Subject({
    required this.id,
    required this.title,
    required this.description,
  });

  // Factory constructor to create a Subject from JSON
  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  // Optional: Create a copyWith method for immutability
  Subject copyWith({
    int? id,
    String? title,
    String? description,
  }) {
    return Subject(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Subject{id: $id, title: $title, description: $description}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Subject &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              title == other.title &&
              description == other.description;

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ description.hashCode;
}