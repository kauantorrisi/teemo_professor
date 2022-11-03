import 'dart:convert';

class SelectionModel {
  SelectionModel({
    this.perk,
    this.var1,
    this.var2,
    this.var3,
  });

  final int? perk;
  final int? var1;
  final int? var2;
  final int? var3;

  factory SelectionModel.fromJson(String str) =>
      SelectionModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SelectionModel.fromMap(Map<String, dynamic> json) => SelectionModel(
        perk: json["perk"],
        var1: json["var1"],
        var2: json["var2"],
        var3: json["var3"],
      );

  Map<String, dynamic> toMap() => {
        "perk": perk,
        "var1": var1,
        "var2": var2,
        "var3": var3,
      };
}
