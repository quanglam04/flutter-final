import '../entities/category.dart';

abstract class CategoryRepository {
  List<Category> getCategories();

  Category? getCategoryById(String id);
}