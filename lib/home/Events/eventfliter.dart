import 'package:flutter/material.dart';

class CategoryModelEvent {
  final String name;
  final int index;
  final IconData icon;

  CategoryModelEvent({required this.name, required this.index, required this.icon});

  static List<CategoryModelEvent> categories = [
    CategoryModelEvent(name: 'Sport', index: 1, icon: Icons.sports_soccer_rounded),
    CategoryModelEvent(name: 'Birthday', index: 2, icon: Icons.cake_rounded),
    CategoryModelEvent(name: 'Meeting', index: 3, icon: Icons.groups_rounded),
    CategoryModelEvent(name: 'Gaming', index: 4, icon: Icons.sports_esports_rounded),
    CategoryModelEvent(name: 'Eating', index: 5, icon: Icons.restaurant_rounded),
    CategoryModelEvent(name: 'Holiday', index: 6, icon: Icons.beach_access_rounded),
    CategoryModelEvent(name: 'Exhibition', index: 7, icon: Icons.museum_rounded),
    CategoryModelEvent(name: 'Workshop', index: 8, icon: Icons.build_rounded),
    CategoryModelEvent(name: 'Book Club', index: 9, icon: Icons.menu_book_rounded),
  ];
}
