class OrderModel {
  final String orderId;
  final String petId;
  final String userId;
  final String orderStatus;
  final String date;
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
  final String petStatus;
  final String notes;
  final String addeddate;
  final String photo;

  OrderModel(
      {required this.orderId,
      required this.petId,
      required this.userId,
      required this.orderStatus,
      required this.date,
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
      required this.petStatus,
      required this.notes,
      required this.addeddate,
      required this.photo});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
        orderId: json['order_id'],
        petId: json['pet_id'],
        userId: json['user_id'],
        orderStatus: json['order_status'],
        date: json['date'],
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
        petStatus: json['pet_status'],
        notes: json['notes'],
        addeddate: json['addeddate'],
        photo: json['photo']);
  }
}
