import 'package:envently/models/filterModel.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  int indexSelected = CategoryModel.categories.first.index;

  @override
  Widget build(BuildContext context) {
    List categories = CategoryModel.categories;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 40,

        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            bool isSlected = indexSelected == categories[index].index;
            CategoryModel currentCat = categories[index];
            return FilterChip(
              labelStyle: TextStyle(
                color: isSlected ? Theme.of(context).focusColor : Colors.white,
              ),

              selected: isSlected,

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(46),
              ),
              showCheckmark: false,
              side: isSlected
                  ? null
                  : BorderSide(color: Theme.of(context).cardColor),
              selectedColor: Theme.of(context).cardColor,
              backgroundColor: Theme.of(
                context,
              ).bottomNavigationBarTheme.backgroundColor,
              onSelected: (value) {
                setState(() {
                  indexSelected = currentCat.index;
                });
              },
              label: Row(
                spacing: 5,
                children: [
                  Icon(
                    currentCat.icon,
                    color: isSlected
                        ? Theme.of(context).focusColor
                        : Colors.white,
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
