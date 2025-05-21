import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_recommended_hotel_card.dart';

class RecommendedListView extends StatelessWidget {
  const RecommendedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:
          MediaQuery.of(context).size.height *
          0.35, // Slightly larger for responsiveness
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal:
                  MediaQuery.of(context).size.width *
                  0.02, // 2% of screen width
            ),
            child: CustomRecommendedHotelCard(
              imageUrl: "assets/images/hotel_image.png",
              hotelName: "Hilton Hotel, Cairo",
              discount: "50 %",
              rating: 4.5,
              price: '3.000EG',
              location: 'New Cairo, Egypt',
            ),
          );
        },
      ),
    );
  }
}
