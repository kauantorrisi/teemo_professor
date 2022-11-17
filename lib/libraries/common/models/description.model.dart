// ignore_for_file: constant_identifier_names

enum DescriptionModel { PRIMARY_STYLE, SUB_STYLE }

final descriptionValues = EnumValues({
  "primaryStyle": DescriptionModel.PRIMARY_STYLE,
  "subStyle": DescriptionModel.SUB_STYLE
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap!;
  }
}
