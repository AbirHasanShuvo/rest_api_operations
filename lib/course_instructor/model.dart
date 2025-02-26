class Instructor {
  final int id;
  final String firstName;
  final String username;
  final String email;
  final String phone;
  final String experience;
  final String bio;
  final String image;
  final String address;

  Instructor({
    required this.id,
    required this.firstName,
    required this.username,
    required this.email,
    required this.phone,
    required this.experience,
    required this.bio,
    required this.image,
    required this.address,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json['id'],
      firstName: json['first_name'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      experience: json['experience'] ?? '',
      bio: json['bio'] ?? '',
      image: json['image'] ?? '',
      address: json['address_1'] ?? '',
    );
  }
}
