
import '../models/category.dart';
import '../models/result_product.dart';

List<Category> getUniqueCategories(List<Resultproduct> products) {

  List<Category> allCategories = products.map((product) => product.category).toList();
  Set<int> uniqueIds = Set<int>();
  List<Category> uniqueCategories = [];

  for (var category in allCategories) {
    if (!uniqueIds.contains(category.id)) {
      uniqueIds.add(category.id);
      uniqueCategories.add(category);
    }
  }

  return uniqueCategories;
}