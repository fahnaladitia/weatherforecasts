import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/ui/main/cubit/get_current_weather_cubit.dart';

class CurrentPositionAndSearchSection extends StatelessWidget {
  const CurrentPositionAndSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
      builder: (context, state) {
        if (state is GetCurrentWeatherLoaded) {
          return Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: GlassContainer(
                        borderRadius: BorderRadius.circular(24),
                        color: kLight100.withOpacity(0.25),
                        shadowStrength: 0,
                        border: Border.all(color: kLight100.withOpacity(0.8)),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.locationDot,
                                      size: 14,
                                      color: kLight100,
                                      shadows: [
                                        Shadow(
                                          color: kDark500.withOpacity(0.5),
                                          offset: const Offset(-1, 1.5),
                                          blurRadius: 5,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        state.weather.displayLocation,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyle.body1SemiBold(context)?.copyWith(
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
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 8),
                                  FaIcon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 14,
                                    color: kLight100,
                                    shadows: [
                                      Shadow(
                                        color: kDark500.withOpacity(0.5),
                                        offset: const Offset(-1, 1.5),
                                        blurRadius: 5,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    GlassContainer(
                      borderRadius: BorderRadius.circular(8),
                      color: kLight100.withOpacity(0.25),
                      shadowStrength: 0,
                      // border: Border.all(color: kLight100.withOpacity(0.8)),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          overlayColor: MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return kLight100.withOpacity(0.75);
                            }
                            return kLight100.withOpacity(0.50);
                          }),
                          onTap: () {},
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              size: 14,
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
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        if (state is GetCurrentWeatherLoading) {
          return Column(
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Card(
                          margin: EdgeInsets.zero,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const SizedBox(
                            // width: width,
                            height: 64,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Card(
                        margin: EdgeInsets.zero,
                        elevation: 0.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const SizedBox(
                          width: 64,
                          height: 64,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return Column(
          children: [
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: GlassContainer(
                      borderRadius: BorderRadius.circular(24),
                      color: kLight100.withOpacity(0.25),
                      shadowStrength: 0,
                      border: Border.all(color: kLight100.withOpacity(0.8)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.locationDot,
                                  size: 14,
                                  color: kLight100,
                                  shadows: [
                                    Shadow(
                                      color: kDark500.withOpacity(0.5),
                                      offset: const Offset(-1, 1.5),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  'Location',
                                  style: AppTextStyle.body1SemiBold(context)?.copyWith(
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
                            Row(
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.chevronRight,
                                  size: 14,
                                  color: kLight100,
                                  shadows: [
                                    Shadow(
                                      color: kDark500.withOpacity(0.5),
                                      offset: const Offset(-1, 1.5),
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GlassContainer(
                    borderRadius: BorderRadius.circular(8),
                    color: kLight100.withOpacity(0.25),
                    shadowStrength: 0,
                    // border: Border.all(color: kLight100.withOpacity(0.8)),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        overlayColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.pressed)) {
                            return kLight100.withOpacity(0.75);
                          }
                          return kLight100.withOpacity(0.50);
                        }),
                        onTap: () {},
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: 14,
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
