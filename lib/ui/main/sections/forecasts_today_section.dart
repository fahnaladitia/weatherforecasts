import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/ui/main/cubit/get_current_weather_cubit.dart';

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
            child: BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
              builder: (context, state) {
                if (state is GetCurrentWeatherLoading) {
                  return ListView.separated(
                    itemCount: 3,
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
                              // Text(
                              //   // '12:00',
                              //   forecast.date.display("HH:mm"),
                              //   style: AppTextStyle.body1(context)?.copyWith(
                              //     color: kLight100,
                              //   ),
                              // ),
                              Shimmer.fromColors(
                                baseColor: kLight100.withOpacity(0.5),
                                highlightColor: kLight100.withOpacity(0.2),
                                child: Container(
                                  width: 32,
                                  height: 16,
                                  color: kLight100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Image.network(
                              //   // 'https://openweathermap.org/img/wn/10d@2x.png',
                              //   forecast.weatherCondition.getIconUrl(),
                              //   width: 32,
                              //   height: 32,
                              // ),
                              Shimmer.fromColors(
                                baseColor: kLight100.withOpacity(0.5),
                                highlightColor: kLight100.withOpacity(0.2),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  color: kLight100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Text(
                              //   // '28°',
                              //   forecast.weatherMain.displayTemperature(),
                              //   style: AppTextStyle.body1SemiBold(context)?.copyWith(
                              //     color: kLight100,
                              //   ),
                              // ),
                              Shimmer.fromColors(
                                baseColor: kLight100.withOpacity(0.5),
                                highlightColor: kLight100.withOpacity(0.2),
                                child: Container(
                                  width: 32,
                                  height: 16,
                                  color: kLight100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                if (state is GetCurrentWeatherLoaded) {
                  final onlyToday = state.forecasts.where((forecast) {
                    return forecast.date.isToday();
                  }).toList();
                  if (onlyToday.isEmpty) {
                    return SizedBox(
                      height: 144,
                      child: Center(
                        child: Text(
                          'No data available',
                          style: AppTextStyle.body1SemiBold(context)?.copyWith(color: kLight100),
                        ),
                      ),
                    );
                  }
                  return ListView.separated(
                    itemCount: onlyToday.length,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 8,
                      bottom: 16,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: 16),
                    itemBuilder: (context, index) {
                      final forecast = onlyToday[index];
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
                                // '12:00',
                                forecast.date.display("HH:mm"),
                                style: AppTextStyle.body1(context)?.copyWith(
                                  color: kLight100,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Image.network(
                                // 'https://openweathermap.org/img/wn/10d@2x.png',
                                forecast.weatherCondition.getIconUrl(),
                                width: 32,
                                height: 32,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                // '28°',
                                forecast.weatherMain.displayTemperature(),
                                style: AppTextStyle.body1SemiBold(context)?.copyWith(
                                  color: kLight100,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return ListView.separated(
                  itemCount: 3,
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
                              'XX:XX',
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Image.network(
                            //   'https://openweathermap.org/img/wn/10d@2x.png',
                            //   width: 32,
                            //   height: 32,
                            // ),
                            Container(
                              width: 32,
                              height: 32,
                              color: kLight100,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'XX°',
                              style: AppTextStyle.body1SemiBold(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
