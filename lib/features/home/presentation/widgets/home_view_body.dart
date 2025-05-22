import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_label.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_location_layout.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_nearby_hotel_list_view.dart';
import 'package:hotel_app/features/home/presentation/widgets/recommended_list_view.dart';
import 'package:hotel_app/features/home/presentation/widgets/search_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomLocationLayout(),
            SizedBox(height: 16.0),
            CustomSearchBar(),
            SizedBox(height: 16.0),
            CustomLabel(text1: 'Recommended Hotel', text2: 'See all'),
            SizedBox(height: 16.0),
            RecommendedListView(),
            SizedBox(height: 16.0),
            CustomLabel(text1: 'Nearby Hotel', text2: 'See all'),
            SizedBox(height: 16.0),

            // CustomNearbyHotelCard(
            //   imageUrl: "assets/images/hotel_image.png",
            //   hotelName: "Hilton Hotel,Cairo",
            //   discount: "50 %",
            //   rating: 4.5,
            //   price: '3.0000EG',
            //   location: 'New Cairo, Egypt',
            // ),
            CustomNearbyHotelListView(),
          ],
        ),
      ),
    );
  }
}
