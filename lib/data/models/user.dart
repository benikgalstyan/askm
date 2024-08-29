class User {
  User(this.email, {this.username});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      json['email'] as String,
      username: json['username'] as String?,
    );
  }

  final String email;
  final String? username;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
    };
  }
}
