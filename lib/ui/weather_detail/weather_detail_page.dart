import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/core/components/components.dart';
import 'package:weatherforecasts/ui/main/cubit/get_current_weather_cubit.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({super.key});

  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  late final GetCurrentWeatherCubit _getCurrentWeatherCubit;

  @override
  void initState() {
    super.initState();
    _getCurrentWeatherCubit = Get.arguments as GetCurrentWeatherCubit;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentWeatherCubit, GetCurrentWeatherState>(
      bloc: _getCurrentWeatherCubit,
      builder: (context, state) {
        if (state is GetCurrentWeatherLoaded) {
          return BasicScaffold(
            body: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // HERO SECTION
                Hero(
                  tag: 'weather_detail_hero',
                  child: Container(
                    height: 200,
                    color: Colors.blue,
                    child: Center(
                        child: Text(
                      state.weather.displayLocation,
                      style: AppTextStyle.body1SemiBold(context)?.copyWith(
                        color: Colors.white,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          );
        }
        return BasicScaffold(
            body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // HERO SECTION
            Hero(
              tag: 'weather_detail_hero',
              child: Container(
                height: 200,
                color: Colors.blue,
              ),
            ),
          ],
        ));
      },
    );
  }
}
