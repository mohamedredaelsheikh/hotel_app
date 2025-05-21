import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_night_price.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_discount_label.dart';
import 'package:hotel_app/features/home/presentation/widgets/rating_widget.dart';

class CustomNearbyHotelInfo extends StatelessWidget {
  const CustomNearbyHotelInfo({
    super.key,
    required this.discount,
    required this.rating,
    required this.hotelName,
    required this.price,
    required this.location,
  });

  final String discount;
  final double rating;
  final String hotelName;
  final String price;
  final String location;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingValue = screenWidth * 0.02; // 2% of screen width
    final fontScale = screenWidth > 600 ? 1.2 : 1.0; // Larger font for tablets

    return Padding(
      padding: EdgeInsets.all(paddingValue),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DiscountLabel(discount: discount),
              RatingWidget(rating: rating),
            ],
          ),
          SizedBox(height: paddingValue),
          Text(
            hotelName,
            style: TextStyle(
              fontSize: 18.0 * fontScale,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis, // Truncate long text
            maxLines: 2, // Allow wrapping to 2 lines
          ),
          SizedBox(height: paddingValue),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                size: 16.0 * fontScale,
                color: Colors.grey[600],
              ),
              SizedBox(width: paddingValue * 0.5),
              Flexible(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 14.0 * fontScale,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis, // Truncate if overflow
                  maxLines: 1,
                ),
              ),
            ],
          ),
          SizedBox(height: paddingValue),
          CustomNightPrice(price: price),
        ],
      ),
    );
  }
}
