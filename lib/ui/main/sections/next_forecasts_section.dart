import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weatherforecasts/core/common/common.dart';

class NextForecastsSection extends StatelessWidget {
  const NextForecastsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weather Forecast 5 day - Vertical List
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Next Forecast',
            style: AppTextStyle.heading5(context)?.copyWith(
              color: kLight100,
              shadows: [
                Shadow(
                  color: kDark500.withOpacity(0.5),
                  offset: const Offset(-1, 1.5),
                  blurRadius: 5,
                ),
              ],
            ),
          ),
        ),
        ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 8,
            bottom: 16,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kLight200,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: kDark500.withOpacity(0.5),
                    offset: const Offset(-1, 1.5),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              kBlue300,
                              kBlue500,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          'https://openweathermap.org/img/wn/10d.png',
                          width: 32,
                          height: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Monday, 18 March',
                        style: AppTextStyle.body1SemiBold(context),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 8),
                      Text(
                        '28°',
                        style: AppTextStyle.body1SemiBold(context),
                      ),
                      const SizedBox(width: 8),
                      // Button
                      const FaIcon(
                        FontAwesomeIcons.chevronRight,
                        size: 14,
                        color: kDark500,
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
