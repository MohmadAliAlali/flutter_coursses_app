
class CoursesModel {
  final int id;
  final String image;
  final String name;
  final String description;
  final int time;

// In minutes

  CoursesModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.time

  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'description': description,
      'time': time,

    };
  }
}