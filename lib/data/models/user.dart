class User {
  User({required this.id, required this.name, required this.email});

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'],
        name: map['name'],
        email: map['email'],
      );

  final String id;
  final String name;
  final String email;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
