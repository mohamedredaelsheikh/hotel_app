import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_nearby_hotel_card.dart';

class CustomNearbyHotelListView extends StatelessWidget {
  const CustomNearbyHotelListView({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingValue =
        MediaQuery.of(context).size.width * 0.02; // 2% of screen width

    return SizedBox(
      height: screenHeight * 0.45, // Adjusted to 45% for better fit
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: paddingValue,
              horizontal: paddingValue,
            ),
            child: CustomNearbyHotelCard(
              imageUrl: "assets/images/hotel_image.png",
              hotelName: "Hilton Hotel, Cairo",
              discount: "50 %",
              rating: 4.5,
              price: '3.0000EG',
              location: 'New Cairo, Egypt',
            ),
          );
        },
      ),
    );
  }
}
