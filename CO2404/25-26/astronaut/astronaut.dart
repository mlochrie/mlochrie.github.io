class AstronautModel {
  String craft = "";
  String name = "";

  AstronautModel({required this.craft, required this.name});

  AstronautModel.fromJson(Map<String, dynamic> json) {
    craft = json['craft'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['craft'] = craft;
    data['name'] = name;
    return data;
  }
}
