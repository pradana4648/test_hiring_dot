class User {
  final int id;
  final String username;
  final String fullName;
  final String email;
  final String phone;
  final String avatar;

  const User({
    this.id = 0,
    this.username = '',
    this.fullName = '',
    this.email = '',
    this.phone = '',
    this.avatar = '',
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      username: map['username'] ?? '',
      fullName: map['fullname'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      avatar: map['avatar'] ?? '',
    );
  }
}
