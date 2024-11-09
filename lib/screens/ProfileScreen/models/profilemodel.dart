class ProfileModel {
  final String firstname;
  final String lastname;
  final String dob;
  final String phone;
  final String email;
  final String address;
  final String gender;
  final String userid;
  final String image;

  ProfileModel(
      {required this.firstname,
      required this.lastname,
      required this.dob,
      required this.phone,
      required this.email,
      required this.address,
      required this.gender,
      required this.image,
      required this.userid});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
        firstname: json['firstname'],
        lastname: json['lastname'],
        dob: json['dob'],
        phone: json['phone'],
        email: json['email'],
        address: json['address'],
        gender: json['gender'],
        image: json['photo'],
        userid: json['userid']);
  }
}
