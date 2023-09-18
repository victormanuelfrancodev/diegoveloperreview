enum Name { CLOTHES1, DA, FURNITURE, OTHERS, SHOES }

final nameValues = EnumValues({
  "Clothes1": Name.CLOTHES1,
  "Da": Name.DA,
  "Furniture": Name.FURNITURE,
  "Others": Name.OTHERS,
  "Shoes": Name.SHOES
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
