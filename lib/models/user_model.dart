
class Users {
  String id; // Firestore document ID
  String name;
  String email;
  String password; // Consider not storing this in plaintext
  String type; // Type of user (guide, tourist, admin)

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.type,
  });

  factory Users.fromJson(Map<String, dynamic> json, String id) {
    return Users(
      id: id,
      name: json['name'],
      email: json['email'],
      password: json['password'], // Ensure to handle securely
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password, // Ensure to handle securely
      'type': type,
    };
  }
}
