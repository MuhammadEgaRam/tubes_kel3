import 'package:tubes_kel3/models/onboard_model.dart';
import 'package:tubes_kel3/models/dot_indicator.dart';

import 'package:flutter/material.dart';
import 'package:tubes_kel3/routes/route.dart';

class OnboardingContent extends StatelessWidget {
  
  final String image;
  final String title;
  final String description;

  const OnboardingContent(
      {Key? key,
      required this.image,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                image,
                width: 270,
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _indexPage = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 24,
                    ),
                  ),
                   TextButton(
                    onPressed: () {
                      // Untuk mengskip onboarding dan langsung ke sign-in
                      Navigator.pushReplacementNamed(context, Routes.signIn);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 70, 187, 255),
                      ),
                    ),
                  )

                ],
              ),
            ),
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _indexPage = index;
                  });
                },
                itemCount: onboard_data.length,
                controller: _pageController,
                itemBuilder: (context, index) => OnboardingContent(
                  image: onboard_data[index].image,
                  title: onboard_data[index].title,
                  description: onboard_data[index].description,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                  onboard_data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15),
                    child: DotIndicator(
                      isActive: index == _indexPage,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 40, left: 40),
              child: InkWell(
                onTap: () {
                  // Jika tombol "Get Started" ditekan, langsung arahkan ke sign-in
                  if (_indexPage == onboard_data.length - 1) {
                    Navigator.pushReplacementNamed(context, Routes.signIn);
                  } else {
                    // Jika bukan halaman terakhir, pindah ke halaman selanjutnya
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromARGB(255, 63, 136, 247),
                  ),
                  child: Center(
                    child: Text(
                      _indexPage == onboard_data.length - 1
                          ? 'Get Started'
                          : 'Next',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 85,
            ),
          ],
        ),
      ),
    );
  }
}
