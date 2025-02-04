class CustomUserModel {
  final String gender;
  // final String name;
  // final String city;
  // final String country;

  // final String postcode;
  // final String email;
  // final String phone;
  // final String cell;
  final Name? name;
  // final UserLocation userLocation;
  // final UserDob userDob;
  // final UserPicture userPicture;

  CustomUserModel({
    required this.gender,
    required this.name,

    //   required this.cell,
    // required this.city,
    // required this.country,
    // required this.email,

    // required this.name,
    // required this.phone,
    // required this.postcode,

    // required this.userDob,
    // required this.userLocation,
    // required this.userPicture
  });

  factory CustomUserModel.fromJson(Map<String, dynamic> json) {
    return CustomUserModel(
        gender: json['gender'],
        name: json['name'] == null ? null : Name.fromJson(json['name']));
  }
}

class Name {
  final String title;
  final String first;
  final String last;

  Name({required this.first, required this.last, required this.title});

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(title: json['title'], first: json['first'], last: json['last']);
  }
}

class UserLocation {}

class UserCoordinates {}

class UserTimezone {}

class UserLoginInfo {}

class UserDob {}

class UserPicture {}

class UserRegistered {}
