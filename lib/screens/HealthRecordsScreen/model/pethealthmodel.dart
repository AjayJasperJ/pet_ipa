class HealthRecordModel {
  late final String petid;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String sex;
  final String color;
  final String weight;
  final String dob;
  final String microchipid;
  final String diet;
  final String behaviour;
  final String status;
  final String caringTips;
  final String addeddate;
  final String photo;
  final String vaccine;
  final String dateOfVaccine;
  final String medicine;
  final String allergies;
  final String medicalHistory;
  final String doctorName;
  final String doctorPhone;

  HealthRecordModel(
      {required this.petid,
      required this.name,
      required this.species,
      required this.breed,
      required this.age,
      required this.sex,
      required this.color,
      required this.weight,
      required this.dob,
      required this.microchipid,
      required this.diet,
      required this.behaviour,
      required this.status,
      required this.caringTips,
      required this.addeddate,
      required this.photo,
      required this.vaccine,
      required this.dateOfVaccine,
      required this.medicine,
      required this.allergies,
      required this.medicalHistory,
      required this.doctorName,
      required this.doctorPhone});

  factory HealthRecordModel.fromJson(Map<String, dynamic> json) {
    return HealthRecordModel(
        petid: json['petid'],
        name: json['name'],
        species: json['species'],
        breed: json['breed'],
        age: json['age'],
        sex: json['sex'],
        color: json['color'],
        weight: json['weight'],
        dob: json['dob'],
        microchipid: json['microchipid'],
        diet: json['diet'],
        behaviour: json['behaviour'],
        status: json['status'],
        caringTips: json['caring_tips'],
        addeddate: json['addeddate'],
        photo: json['photo'],
        vaccine: json['vaccine'],
        dateOfVaccine: json['date_of_vaccine'],
        medicine: json['medicine'],
        allergies: json['allergies'],
        medicalHistory: json['medical_history'],
        doctorName: json['doctor_name'],
        doctorPhone: json['doctor_phone']);
  }
}
