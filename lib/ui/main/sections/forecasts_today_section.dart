import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:weatherforecasts/core/common/common.dart';

class ForecastsTodaySection extends StatelessWidget {
  const ForecastsTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Today',
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
        SizedBox(
          height: 144,
          child: ScrollConfiguration(
            behavior: NoGlowScrollBehavior(),
            child: ListView.separated(
              itemCount: 5,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16,
              ),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) {
                return GlassContainer(
                  blur: 4,
                  borderRadius: BorderRadius.circular(8),
                  color: kLight100.withOpacity(0.1),
                  shadowStrength: 0,
                  border: Border.all(color: kLight100.withOpacity(0.8)),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '12:00',
                          style: AppTextStyle.body1(context)?.copyWith(
                            color: kLight100,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Image.network(
                          'https://openweathermap.org/img/wn/10d@2x.png',
                          width: 32,
                          height: 32,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '28°',
                          style: AppTextStyle.body1SemiBold(context)?.copyWith(
                            color: kLight100,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
