import 'astronaut.dart';

class Astros {
  List<AstronautModel> people = [];
  int number = 0;
  String message = "";
  Astros({required this.people, required this.number, required this.message});

  Astros.fromJson(Map<String, dynamic> json) {
    if (json['people'] != null) {
      people = <AstronautModel>[];
      json['people'].forEach((v) {
        people.add(AstronautModel.fromJson(v));
      });
    }
    number = json['number'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['people'] = people.map((v) => v.toJson()).toList();
    data['number'] = number;
    data['message'] = message;
    return data;
  }
}
