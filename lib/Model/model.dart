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

class Todos {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todos({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  @override
  String toString() =>
      'Todo(userId:$userId, id:$id, title:$title, completed:$completed)';

  @override
  bool operator ==(covariant Todos other) =>
      userId == other.userId &&
      id == other.id &&
      title == other.title &&
      completed == other.completed;

  @override
  int get hashCode => Object.hashAll(
        [
          userId,
          id,
          title,
          completed,
        ],
      );

  factory Todos.fromMap(Map<String, dynamic> map) {
    return Todos(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }
}

class Photos {
  final int albumId;
  final int id;
  final String title;
  final dynamic imageUrl;
  final String thumbnailUrl;

  Photos({
    required this.albumId,
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.thumbnailUrl,
  });

  @override
  String toString() =>
      'Photos(albumId:$albumId, id:$id, title:$title, imageUrl:$imageUrl, thumbnailUrl:$thumbnailUrl)';

  @override
  bool operator ==(covariant Photos other) =>
      albumId == other.albumId &&
      id == other.id &&
      imageUrl == other.imageUrl &&
      thumbnailUrl == other.thumbnailUrl;

  @override
  int get hashCode => Object.hashAll(
        [
          albumId,
          id,
          title,
          imageUrl,
          thumbnailUrl,
        ],
      );

  factory Photos.fromMap(Map<String, dynamic> map) {
    return Photos(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as dynamic,
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}

class Posts {
  final int id;
  final String title;
  final String body;

  Posts({
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  String toString() => 'Post(id:$id, title:$title, body:$body)';

  @override
  bool operator ==(covariant Posts other) =>
      id == other.id && title == other.title && body == other.body;

  @override
  int get hashCode => Object.hashAll(
        [
          id,
          title,
          body,
        ],
      );

  factory Posts.fromMap(Map<String, dynamic> json) {
    return Posts(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
