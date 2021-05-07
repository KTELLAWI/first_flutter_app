// To parse this JSON data, do
//
//     final contacts = contactsFromJson(jsonString);


class Contacts {
  

  int id;
  String name;
  String phone;

  Contacts({
    this.id,
    this.name,
    this.phone,
  });
factory Contacts.fromJson(Map<String, dynamic> json) => Contacts(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
      );
      Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
    };
}
