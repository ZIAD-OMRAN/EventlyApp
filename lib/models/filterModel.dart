import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final int index;
  final IconData icon;

  CategoryModel({required this.name, required this.index, required this.icon});

  static List<CategoryModel> categories = [
    CategoryModel(name: 'All', index: 0, icon: Icons.grid_view_rounded),
    CategoryModel(name: 'Sport', index: 1, icon: Icons.sports_soccer_rounded),
    CategoryModel(name: 'Birthday', index: 2, icon: Icons.cake_rounded),
    CategoryModel(name: 'Meeting', index: 3, icon: Icons.groups_rounded),
    CategoryModel(name: 'Gaming', index: 4, icon: Icons.sports_esports_rounded),
    CategoryModel(name: 'Eating', index: 5, icon: Icons.restaurant_rounded),
    CategoryModel(name: 'Holiday', index: 6, icon: Icons.beach_access_rounded),
    CategoryModel(name: 'Exhibition', index: 7, icon: Icons.museum_rounded),
    CategoryModel(name: 'Workshop', index: 8, icon: Icons.build_rounded),
    CategoryModel(name: 'Book Club', index: 9, icon: Icons.menu_book_rounded),
  ];
}
