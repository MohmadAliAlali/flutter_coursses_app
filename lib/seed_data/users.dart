class Users{
  static UsersModel reaamUser = UsersModel(
      id: 1,
      image: 'assets/images/icons/click_profile.png',
      name: 'Reaam',
      email: 'Reaam@gmail.com',
      description: 'Lorem ipsum dolor sit amet consectetur. Accumsan scelerisque viverra congue mattis purus. Sed urna aliquet pulvinar mauris donec '
  );
}


class UsersModel {
  final int id;
  final String image;
  final String name;
  final String email;
  final String description;
// In minutes

  UsersModel({
    required this.id,
    required this.image,
    required this.name,
    required this.email,
    required this.description,

  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'email': email,
      'description': description,
    };
  }
}