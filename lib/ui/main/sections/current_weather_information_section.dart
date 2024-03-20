import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/ui/main/cubit/get_current_weather_cubit.dart';

class CurrentWeatherInformationSection extends StatelessWidget {
  const CurrentWeatherInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
      builder: (context, state) {
        if (state is GetCurrentWeatherLoaded) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: GlassContainer(
              borderRadius: BorderRadius.circular(16),
              color: kLight100.withOpacity(0.25),
              shadowStrength: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tanggal,
                        Text(
                          state.weather.displayDate,
                          style: AppTextStyle.body1(context)?.copyWith(
                            color: kLight100,
                          ),
                        ),
                        // Jam
                        Text(
                          state.weather.displayTime,
                          style: AppTextStyle.body1(context)?.copyWith(
                            color: kLight100,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Suhu
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // '28°',
                              state.weather.weatherMain.displayTemperature(),
                              style: AppTextStyle.heading2(context)?.copyWith(
                                color: kLight100,
                                fontSize: 48,
                                shadows: [
                                  Shadow(
                                    color: kDark500.withOpacity(0.5),
                                    offset: const Offset(-1, 1.5),
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              // 'Rain',
                              state.weather.weatherCondition.main,
                              style: AppTextStyle.heading6(context)?.copyWith(
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
                          ],
                        ),
                        Image.network(
                          // 'https://openweathermap.org/img/wn/02n@2x.png',
                          state.weather.weatherCondition.getIconUrl(),
                          width: 94,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            }
                            return const CircularProgressIndicator(color: kLight100);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.wind,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              // '12 km/h',
                              state.weather.weatherWind.display(),
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.temperatureHigh,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              // '30°',
                              state.weather.weatherMain.displayTemperatureMax(),
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                          ],
                        ),
                        // Kelembapan
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.droplet,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              // '80%',
                              state.weather.weatherMain.displayHumidity(),
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.temperatureLow,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              // '24°',
                              state.weather.weatherMain.displayTemperatureMin(),
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Last Update Time with Icon and Button
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () => context.read<GetCurrentWeatherCubit>().getCurrentWeatherLatLng(isUpdate: true),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              // "Last Update 12:00",
                              "Last Update ${state.weather.displayTime}",
                              style: AppTextStyle.body1(context)?.copyWith(
                                color: kLight100,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const FaIcon(
                              FontAwesomeIcons.rotateRight,
                              size: 14,
                              color: kLight100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is GetCurrentWeatherLoading) {
          return Container(
            margin: const EdgeInsets.all(16),
            child: GlassContainer(
              borderRadius: BorderRadius.circular(16),
              color: kLight100.withOpacity(0.25),
              shadowStrength: 0,
              child: Container(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tanggal,
                        // Text(
                        //   'Monday, 18 March 2024',
                        //   style: AppTextStyle.body1(context)?.copyWith(
                        //     color: kLight100,
                        //   ),
                        // ),
                        // Shimmering Text
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 120,
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                        // Jam
                        // Text(
                        //   '12:00',
                        //   style: AppTextStyle.body1(context)?.copyWith(
                        //     color: kLight100,
                        //   ),
                        // ),
                        // Shimmering Text
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            width: 40,
                            height: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Suhu
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(
                            //   '28°',
                            //   style: AppTextStyle.heading2(context)?.copyWith(
                            //     color: kLight100,
                            //     fontSize: 48,
                            //     shadows: [
                            //       Shadow(
                            //         color: kDark500.withOpacity(0.5),
                            //         offset: const Offset(-1, 1.5),
                            //         blurRadius: 5,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 80,
                                height: 32,
                                color: Colors.white,
                              ),
                            ),
                            // Text(
                            //   'Rain',
                            //   style: AppTextStyle.heading6(context)?.copyWith(
                            //     color: kLight100,
                            //     shadows: [
                            //       Shadow(
                            //         color: kDark500.withOpacity(0.5),
                            //         offset: const Offset(-1, 1.5),
                            //         blurRadius: 5,
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 40,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // Image.network(
                        //   'https://openweathermap.org/img/wn/02n@2x.png',
                        //   width: 94,
                        //   loadingBuilder: (context, child, loadingProgress) {
                        //     if (loadingProgress == null) {
                        //       return child;
                        //     }
                        //     return const CircularProgressIndicator(color: kLight100);
                        //   },
                        // ),
                        // Shimmering Image
                        Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            width: 94,
                            height: 94,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.wind,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            // Text(
                            //   '12 km/h',
                            //   style: AppTextStyle.body1(context)?.copyWith(
                            //     color: kLight100,
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 80,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.temperatureHigh,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            // Text(
                            //   '30°',
                            //   style: AppTextStyle.body1(context)?.copyWith(
                            //     color: kLight100,
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 80,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        // Kelembapan
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.droplet,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            // Text(
                            //   '80%',
                            //   style: AppTextStyle.body1(context)?.copyWith(
                            //     color: kLight100,
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 40,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const FaIcon(
                              FontAwesomeIcons.temperatureLow,
                              size: 18,
                              color: kLight100,
                            ),
                            const SizedBox(width: 8),
                            // Text(
                            //   '24°',
                            //   style: AppTextStyle.body1(context)?.copyWith(
                            //     color: kLight100,
                            //   ),
                            // ),
                            // Shimmering Text
                            Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                width: 40,
                                height: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    // Last Update Time with Icon and Button
                    // Material(
                    //   color: Colors.transparent,
                    //   child: InkWell(
                    //     onTap: () {},
                    //     child: Row(
                    //       mainAxisSize: MainAxisSize.min,
                    //       children: [
                    //         Text(
                    //           "Last Update 12:00",
                    //           style: AppTextStyle.body1(context)?.copyWith(
                    //             color: kLight100,
                    //           ),
                    //         ),
                    //         const SizedBox(width: 8),
                    //         const FaIcon(
                    //           FontAwesomeIcons.rotateRight,
                    //           size: 14,
                    //           color: kLight100,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // Shimmering Row
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Container(
                        width: 120,
                        height: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.all(16),
          child: GlassContainer(
            borderRadius: BorderRadius.circular(16),
            color: kLight100.withOpacity(0.25),
            shadowStrength: 0,
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tanggal,
                      Text(
                        // 'Monday, 18 March 2024',
                        'XXX, XX XXXXX XXXX',
                        style: AppTextStyle.body1(context)?.copyWith(
                          color: kLight100,
                        ),
                      ),
                      // Jam
                      Text(
                        'XX:XX',
                        style: AppTextStyle.body1(context)?.copyWith(
                          color: kLight100,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Suhu
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'XX°',
                            style: AppTextStyle.heading2(context)?.copyWith(
                              color: kLight100,
                              fontSize: 48,
                              shadows: [
                                Shadow(
                                  color: kDark500.withOpacity(0.5),
                                  offset: const Offset(-1, 1.5),
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'XXXX',
                            style: AppTextStyle.heading6(context)?.copyWith(
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
                        ],
                      ),
                      // Image.network(
                      //   'https://openweathermap.org/img/wn/02n@2x.png',
                      //   width: 94,
                      //   loadingBuilder: (context, child, loadingProgress) {
                      //     if (loadingProgress == null) {
                      //       return child;
                      //     }
                      //     return const CircularProgressIndicator(color: kLight100);
                      //   },
                      // ),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          width: 94,
                          height: 94,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.wind,
                            size: 18,
                            color: kLight100,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            // '12 km/h',
                            'XX km/h',
                            style: AppTextStyle.body1(context)?.copyWith(
                              color: kLight100,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.temperatureHigh,
                            size: 18,
                            color: kLight100,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            // '30°',
                            'XX°',
                            style: AppTextStyle.body1(context)?.copyWith(
                              color: kLight100,
                            ),
                          ),
                        ],
                      ),
                      // Kelembapan
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.droplet,
                            size: 18,
                            color: kLight100,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            // '80%',
                            'XX%',
                            style: AppTextStyle.body1(context)?.copyWith(
                              color: kLight100,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const FaIcon(
                            FontAwesomeIcons.temperatureLow,
                            size: 18,
                            color: kLight100,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            // '24°',
                            'XX°',
                            style: AppTextStyle.body1(context)?.copyWith(
                              color: kLight100,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // const SizedBox(height: 24),
                  // Last Update Time with Icon and Button
                  // Material(
                  //   color: Colors.transparent,
                  //   child: InkWell(
                  //     onTap: () {},
                  //     child: Row(
                  //       mainAxisSize: MainAxisSize.min,
                  //       children: [
                  //         Text(
                  //           "Last Update 12:00",
                  //           style: AppTextStyle.body1(context)?.copyWith(
                  //             color: kLight100,
                  //           ),
                  //         ),
                  //         const SizedBox(width: 8),
                  //         const FaIcon(
                  //           FontAwesomeIcons.rotateRight,
                  //           size: 14,
                  //           color: kLight100,
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
