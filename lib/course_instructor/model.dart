class Instructor {
  int id;
  String firstName;
  String lastName;
  String username;
  String email;
  String phone;
  String image;
  String bio;

  Instructor({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.image,
    required this.bio,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      image: "https://admin.edubd.tv/" + json['image'], // Append base URL if needed
      bio: json['bio'],
    );
  }
}
