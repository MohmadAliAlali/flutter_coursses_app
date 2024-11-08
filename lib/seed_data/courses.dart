class Courses{
  static List<CoursesModel> getCourses = [html5, python, php, web, gameDev,];
  static CoursesModel html5 = CoursesModel(
      id: 1,
      image: 'assets/images/second_photo.png',
      name: 'HTML5',
      description: 'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 17
  );
  static CoursesModel python = CoursesModel(
      id: 2,
      image: 'assets/images/second_photo.png',
      name: 'Python',
      description: 'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 10
  );
  static CoursesModel php = CoursesModel(
      id: 3,
      image: 'assets/images/second_photo.png',
      name: 'PHP',
      description: '. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 10
  );
  static CoursesModel web = CoursesModel(
      id: 3,
      image: 'assets/images/second_photo.png',
      name: 'Web',
      description: '. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 30
  );
  static CoursesModel gameDev = CoursesModel(
      id: 3,
      image: 'assets/images/second_photo.png',
      name: 'Game Dev',
      description: '. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 30
  );
  static CoursesModel gameDev2 = CoursesModel(
      id: 3,
      image: 'assets/images/second_photo.png',
      name: 'Game Dev',
      description: '. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec ',
      time: 30
  );
}


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