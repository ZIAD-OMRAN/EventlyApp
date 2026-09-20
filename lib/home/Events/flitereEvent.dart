import 'package:envently/consts/appcolors.dart';
import 'package:envently/home/Events/eventfliter.dart';

import 'package:flutter/material.dart';

class FilterWidgetevent extends StatefulWidget {
  const FilterWidgetevent({this.onCategorySelected, super.key});
  final Function(int)? onCategorySelected;
  @override
  State<FilterWidgetevent> createState() => _FilterWidgeteventState();
}

class _FilterWidgeteventState extends State<FilterWidgetevent> {
  int indexSelected = CategoryModelEvent.categories.first.index;

  @override
  Widget build(BuildContext context) {
    List categories = CategoryModelEvent.categories;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 40,

        child: ListView.separated(
          padding: EdgeInsets.only(left: 20),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSlected = indexSelected == categories[index].index;
            CategoryModelEvent currentCat = categories[index];
            return FilterChip(
              labelStyle: TextStyle(
                color: isSlected
                    ? Theme.of(context).dividerColor
                    : AppColors.primaryColor,
              ),

              selected: isSlected,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(46),
              ),
              showCheckmark: false,
              side: isSlected
                  ? null
                  : BorderSide(color: AppColors.primaryColor),
              selectedColor: AppColors.primaryColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              onSelected: (value) {
                setState(() {
                  indexSelected = currentCat.index;
                });
                widget.onCategorySelected?.call(currentCat.index);
              },
              label: Row(
                spacing: 5,
                children: [
                  Icon(
                    currentCat.icon,
                    color: isSlected
                        ? Theme.of(context).dividerColor
                        : AppColors.primaryColor,
                  ),
                  Text(currentCat.name),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 10);
          },
          itemCount: categories.length,
        ),
      ),
    );
  }
}
