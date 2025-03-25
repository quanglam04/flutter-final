import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';

@Injectable(as: CategoryRepository)
class CategoryRepositoryImpl extends CategoryRepository {
  CategoryRepositoryImpl();

  final List<Category> _categories = [
    const Category(
      id: 'health',
      name: 'Health',
      icon: Icons.favorite,
      color: Colors.blue,
    ),
    const Category(
      id: 'work',
      name: 'Work',
      icon: Icons.work,
      color: Colors.green,
    ),
    const Category(
      id: 'personal',
      name: 'Personal',
      icon: Icons.person,
      color: Colors.purple,
    ),
    const Category(
      id: 'shopping',
      name: 'Shopping',
      icon: Icons.shopping_bag,
      color: Colors.orange,
    ),
    const Category(
      id: 'learning',
      name: 'Learning',
      icon: Icons.school,
      color: Colors.grey,
    ),
  ];

  @override
  List<Category> getCategories() {
    return _categories;
  }

  @override
  Category? getCategoryById(String id) {
    try {
      return _categories.firstWhere((category) => category.id == id);
    } catch (_) {
      return null;
    }
  }
}