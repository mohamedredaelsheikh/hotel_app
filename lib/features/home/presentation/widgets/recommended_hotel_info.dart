import 'package:flutter/material.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_night_price.dart';
import 'package:hotel_app/features/home/presentation/widgets/custom_discount_label.dart';
import 'package:hotel_app/features/home/presentation/widgets/rating_widget.dart';

class RecommendedHotelInfo extends StatelessWidget {
  final String discount;
  final double rating;
  final String hotelName;
  final String price;
  final String location;

  const RecommendedHotelInfo({
    super.key,
    required this.discount,
    required this.rating,
    required this.hotelName,
    required this.price,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final paddingValue = screenWidth * 0.02; // 2% of screen width
    final fontScale = screenWidth > 600 ? 1.0 : 0.8; // Adjust font for tablets

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
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      hotelName,
                      style: TextStyle(
                        fontSize: 18.0 * fontScale,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow:
                          TextOverflow
                              .ellipsis, // Truncate with ellipsis if overflow
                      maxLines: 2, // Allow wrapping to 2 lines
                    ),
                  ),
                  SizedBox(width: paddingValue),
                  CustomNightPrice(price: price),
                ],
              );
            },
          ),
          SizedBox(height: paddingValue),
          Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.grey[600],
                size: 20.0 * fontScale,
              ),
              SizedBox(width: paddingValue * 0.5),
              Flexible(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 17.0 * fontScale,
                    color: Colors.grey[600],
                  ),
                  overflow: TextOverflow.ellipsis, // Truncate if overflow
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
