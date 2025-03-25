import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Category extends Equatable {
  const Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  factory Category.create(String name, IconData icon, Color color) {
    return Category(
      id: const Uuid().v4(),
      name: name,
      icon: icon,
      color: color,
    );
  }

  final String id;
  final String name;
  final IconData icon;
  final Color color;

  @override
  List<Object?> get props => [id, name, icon, color];
}