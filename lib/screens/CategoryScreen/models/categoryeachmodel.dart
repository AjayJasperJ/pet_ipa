class PetCategoryModel {
  final String petid;
  final String name;
  final String species;
  final String breed;
  final String age;
  final String sex;
  final String color;
  final String weight;
  final String dob;
  final String microchipid;
  final String aid;
  final String diet;
  final String behaviour;
  final String status;
  final String notes;
  final String addeddate;
  final String photo;

  PetCategoryModel(
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
      required this.aid,
      required this.diet,
      required this.behaviour,
      required this.status,
      required this.notes,
      required this.addeddate,
      required this.photo});

  factory PetCategoryModel.fromJson(Map<String, dynamic> json) {
    return PetCategoryModel(
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
        aid: json['aid'],
        diet: json['diet'],
        behaviour: json['behaviour'],
        status: json['status'],
        notes: json['notes'],
        addeddate: json['addeddate'],
        photo: json['photo']);
  }
}
