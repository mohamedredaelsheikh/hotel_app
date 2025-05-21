import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_hotel_image.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_nearby_hotel_info.dart';

class CustomNearbyHotelCard extends StatelessWidget {
  const CustomNearbyHotelCard({
    super.key,
    required this.imageUrl,
    required this.discount,
    required this.rating,
    required this.hotelName,
    required this.price,
    required this.location,
  });

  final String imageUrl;
  final String discount;
  final double rating;
  final String hotelName;
  final String price;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final screenWidth = MediaQuery.of(context).size.width;
          final isLandscape =
              MediaQuery.of(context).orientation == Orientation.landscape;
          final imageWidth =
              isLandscape
                  ? screenWidth * 0.25
                  : screenWidth * 0.35; // Adjust for orientation
          final imageHeight =
              isLandscape ? 120.0 : 140.0; // Adjust height for orientation

          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: imageWidth,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(12.0),
                    bottom: Radius.circular(15.0),
                  ),
                  child: CustomHotelImage(
                    imageUrl: imageUrl,
                    height: imageHeight,
                    radius: 16,
                  ),
                ),
              ),
              Expanded(
                child: CustomNearbyHotelInfo(
                  discount: discount,
                  rating: rating,
                  hotelName: hotelName,
                  price: price,
                  location: location,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
