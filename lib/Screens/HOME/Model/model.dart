class PersonModel {
  final String? name;
  final String? height;
  final String? mass;
  final String? hairColor;
  final String? skinColor;

  PersonModel({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
  });

  factory PersonModel.fromJson(Map<String, dynamic> json) {
    return PersonModel(
      name: json['name'],
      height: json['height'],
      mass: json['mass'],
      hairColor: json['hair_color'],
      skinColor: json['skin_color'],
    );
  }
}





//  Map<String, dynamic> toJson() {
//     return {
//       'name': name,
//       'height': height,
//       'mass': mass,
//       'hairColor': hairColor,
//       'skinColor': skinColor,
//     };
//   }
