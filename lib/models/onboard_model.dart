class OnboardModel {
  final String image;

  final String title;

  final String description;

  OnboardModel(
      {required this.image, required this.title, required this.description});
}

final List<OnboardModel> onboard_data = [
  OnboardModel(
      image: 'assets/images/logo.png',
      title: 'Innovation in Every Swipe',
      description: 'SmartCard is an intelligent card integrating advanced technology for diverse practical applications.'),
  OnboardModel(
      image: 'assets/images/onboard1.png',
      title: 'Fast OCR KTM',
      description: 'Enjoy the OCR Experience\nScan KTM quickly and accurately'),
  OnboardModel(
      image: 'assets/images/onboard2.png',
      title: 'Secure Data',
      description:
          'SmartCard protects your data by adhering to community guidelines'),
];
