import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:rama/screens/Signin.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../shared/components/components.dart';
import '../shared/components/constants.dart';

class onboarding extends StatelessWidget{

  final controller = LiquidController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            LiquidSwipe(
              liquidController: controller,
            enableSideReveal: true,
            onPageChangeCallback: (index){},
            slideIconWidget: const Icon(Icons.arrow_back_ios,
            color: black54,
            ),
            pages: [
              onBoarding(
                url: 'assets/images/d2.png',
                  title: 'Find your perfect doctor',
                about: 'Easy way to make an perfect doctor best treatment',
                width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height),
              onBoarding(
                url: 'assets/images/d1.png',
                  title: 'Book an appointment',
                about: 'You can search a doctor and add appointment ...',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height),
              onBoarding(
                  url: 'assets/images/d4.png',
              title: 'keep your teeth healthy',
              about: 'we have an article that help you ...',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height
              ),
            ],
          ),
            Positioned(
              bottom: 50,
            left: 16,
            right: 16,
            child: Column(
              children: [
                AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage,
                    count: 3,
                  effect: const ExpandingDotsEffect(
                    spacing:  8.0,
                    radius:  4.0,
                    dotWidth:  20.0,
                    dotHeight:  10.0,
                    paintStyle:  PaintingStyle.fill,
                    strokeWidth:  1.5,
                    dotColor: grey,
                    activeDotColor: indigoAccent,
                  ),
                  // onDotClicked: (index){
                  // controller.animateToPage(page: index);
                  // },
                ),
                const SizedBox(height: 50.0,),
                Center(
                  child: defaultGradientBottom(
                        text: 'Get Started' ,
                        width: 200.0,
                        height: 50.0,
                      color1:  defaultGreen3,
                      color2: defaultGreen,
                        function: () {
                          Get.to(SigninScreeen());
                        }
                    ),
                ),
              ],
            ),),
      ],
        ),
    );
  }

}