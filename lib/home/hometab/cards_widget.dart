import 'package:envently/consts/appcolors.dart';
import 'package:envently/models/evants_model.dart';
import 'package:envently/models/cardmodel.dart';
import 'package:flutter/material.dart';

class CardsWidget extends StatelessWidget {
  const CardsWidget({super.key, required this.events});

  final List<EventModel> events;

  String getCategoryImage(String category) {
    final selectedCategory = Cardmodel.cards.firstWhere(
      (item) => item.name.toLowerCase() == category.toLowerCase(),
      orElse: () => Cardmodel.cards.first,
    );

    return selectedCategory.imagePath;
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: screenHeight * .25,

              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(getCategoryImage(event.category)),
                  fit: BoxFit.cover,
                ),
                border: Border.all(color: AppColors.primaryColor),
                borderRadius: BorderRadius.circular(16),
              ),

              child: Padding(
                padding: const EdgeInsets.all(8.0),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      event.date,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(event.description),

                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            event.isFave
                                ? Icons.favorite
                                : Icons.favorite_border,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
