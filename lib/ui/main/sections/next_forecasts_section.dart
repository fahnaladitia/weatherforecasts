import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/core/components/components.dart';
import 'package:weatherforecasts/domain/models/weather.dart';
import 'package:weatherforecasts/ui/main/cubit/get_current_weather_cubit.dart';

class NextForecastsSection extends StatelessWidget {
  const NextForecastsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
          builder: (context, state) {
            if (state is GetCurrentWeatherLoading) {
              return ListView.separated(
                itemCount: 3,
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
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 32,
                                height: 32,
                                // padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: kLight100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            // Text(
                            //   'Monday, 18 March',
                            //   style: AppTextStyle.body1SemiBold(context),
                            // ),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 100,
                                height: 16,
                                decoration: BoxDecoration(
                                  color: kLight100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     const SizedBox(width: 8),
                        //     Text(
                        //       '28°',
                        //       style: AppTextStyle.body1SemiBold(context),
                        //     ),
                        //     const SizedBox(width: 8),
                        //     // Button
                        //     const FaIcon(
                        //       FontAwesomeIcons.chevronRight,
                        //       size: 14,
                        //       color: kDark500,
                        //     )
                        //   ],
                        // )
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 60,
                            height: 16,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: kLight100,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            if (state is GetCurrentWeatherLoaded) {
              final List<Weather> listWeather = [];
              for (final data in state.forecasts) {
                final dayAlreadyExist = listWeather.any((element) {
                  return element.date.isSameDate(data.date);
                });
                if (dayAlreadyExist || data.date.isToday()) {
                  continue;
                }
                listWeather.add(data);
              }

              return ListView.separated(
                itemCount: listWeather.length + 1,
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
                  final lastIndex = listWeather.length;
                  if (lastIndex == index) {
                    return BasicButton(
                      width: double.infinity,
                      type: ButtonType.tertiary,
                      text: 'See more',
                      onPressed: () {},
                    );
                  }
                  final forecast = listWeather[index];
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
                                // 'https://openweathermap.org/img/wn/10d.png',
                                forecast.weatherCondition.getIconUrl(),
                                width: 32,
                                height: 32,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              // 'Monday, 18 March',
                              forecast.date.display('EEEE, d MMMM'),
                              style: AppTextStyle.body1SemiBold(context),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 8),
                            Text(
                              // '28°',
                              forecast.weatherMain.displayTemperature(),
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
              );
            }
            return ListView.separated(
              itemCount: 3,
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
                            // child: Image.network(
                            //   'https://openweathermap.org/img/wn/10d.png',
                            //   width: 32,
                            //   height: 32,
                            // ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'XXXXX, XX XXXXX',
                            style: AppTextStyle.body1SemiBold(context),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 8),
                          Text(
                            'XX°',
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
            );
          },
        ),
      ],
    );
  }
}
