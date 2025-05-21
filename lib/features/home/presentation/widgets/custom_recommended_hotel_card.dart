import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_hotel_image.dart';
import 'package:hotel_app/features/home/presentation/widgets/recommended_hotel_info.dart';

class CustomRecommendedHotelCard extends StatelessWidget {
  final String imageUrl;
  final String discount;
  final double rating;
  final String hotelName;
  final String price;
  final String location;

  const CustomRecommendedHotelCard({
    super.key,
    required this.imageUrl,
    required this.discount,
    required this.rating,
    required this.hotelName,
    required this.price,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final cardWidth =
              screenWidth > 600
                  ? screenWidth * 0.3
                  : screenWidth * 0.45; // Adjust for tablets
          return SizedBox(
            width: cardWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12.0),
                  ),
                  child: CustomHotelImage(
                    imageUrl: imageUrl,
                    height:
                        MediaQuery.of(context).size.height *
                        0.2, // Responsive height
                  ),
                ),
                RecommendedHotelInfo(
                  discount: discount,
                  rating: rating,
                  hotelName: hotelName,
                  price: price,
                  location: location,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
