class UserToken {
  final String refresh;
  final String access;


  UserToken({
    required this.refresh,
    required this.access,

  });

  factory UserToken.fromJson(Map<String, dynamic> json) {
    return UserToken(
      refresh: json['refresh'],
      access: json['access'],
    );
  }
}