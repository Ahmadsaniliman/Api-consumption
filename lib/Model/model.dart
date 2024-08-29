class User {
  final String name;
  final int id;
  final String username;
  final String email;
  final dynamic address;
  final dynamic phone;
  final String website;
  final dynamic company;

  User({
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
    required this.name,
    required this.id,
    required this.username,
    required this.email,
  });

  @override
  String toString() {
    return 'User(name: $name, id: $id, username: $username, email: $email)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        other.username == username &&
        other.email == email;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      id: map['id'] as int,
      username: map['username'] as String,
      email: map['email'] as String,
      address: map['address'] as dynamic,
      phone: map['phone'] as dynamic,
      website: map['website'] as String,
      company: map['company'] as dynamic,
    );
  }

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          name,
          username,
          email,
          address,
          phone,
          website,
          company,
        ],
      );
}
