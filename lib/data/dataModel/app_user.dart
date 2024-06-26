import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  static const collectionName = "users";
  static AppUser? currentUser ;
  late String id;
  late String email;
  late String firstName;
  late String lastName;
  late num age;
  late String gender;
  late num height;
  late num weight;

  AppUser(
      {required this.id,
      required this.email,
      required this.firstName,
      required this.lastName,
      required this.age,
      required this.gender,
      required this.height,
      required this.weight});

  AppUser.fromJson(Map json){
    id = json["id"];
    email = json["email"];
    firstName = json["firstName"];
    lastName = json["lastName"];
    age = json["age"];
    gender = json["gender"];
    height = json["height"];
    weight = json["weight"];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['age'] = age;
    map['gender'] = gender;
    map['height'] = height;
    map['weight'] = weight;
    return map;
  }

  static CollectionReference<AppUser> collection(){
    return  FirebaseFirestore
        .instance
        .collection(AppUser.collectionName)
        .withConverter<AppUser>(
      fromFirestore: (snapshot, _) {
        return AppUser.fromJson(snapshot.data()!);
      },
      toFirestore: (user, _) {
        return user.toJson();
      },
    );
  }

}
