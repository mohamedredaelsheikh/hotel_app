class OnBoardingModel {
  final String image;
  final String description;

  OnBoardingModel({required this.image, required this.description});
}

final List<OnBoardingModel> onBoardingPages = [
  OnBoardingModel(
    image: 'assets/images/rafiki.svg',
    description:
        'Book your hotel easy and quickly, and enjoy a comfortable stay at the best prices!',
  ),
  OnBoardingModel(
    image: 'assets/images/pana.svg',
    description:
        'Find and book your perfect hotel in just a few taps a seamless stay!',
  ),
  OnBoardingModel(
    image: 'assets/images/cuate.svg',
    description:
        'Ready for you 375 x 400 your hotel in seconds and enjoy your adventure!',
  ),
];
