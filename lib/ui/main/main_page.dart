import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/core/components/components.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BasicScaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  'Kota Samarinda',
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
            Container(
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
                            'Monday, 18 March 2024',
                            style: AppTextStyle.body1(context)?.copyWith(
                              color: kLight100,
                            ),
                          ),
                          // Jam
                          Text(
                            '12:00',
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
                                '28°',
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
                                'Rain',
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
                            'https://openweathermap.org/img/wn/02n@2x.png',
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
                                '12 km/h',
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
                                '30°',
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
                                '80%',
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
                                '24°',
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
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Last Update 12:00",
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
            ),
            // const SizedBox(height: 26),
            // Weather Forecast 1 day & 3 hour - Horizontal List
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
        ),
      ),
    );
  }
}
