import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherforecasts/core/common/common.dart';
import 'package:weatherforecasts/core/components/components.dart';
import 'package:flutter/material.dart';
import 'package:weatherforecasts/di.dart';

import 'cubit/get_current_weather_cubit.dart';
import 'sections/current_position_and_search_section.dart';
import 'sections/current_weather_information_section.dart';
import 'sections/forecasts_today_section.dart';
import 'sections/next_forecasts_section.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final GetCurrentWeatherCubit _getCurrentWeatherCubit;

  @override
  void initState() {
    super.initState();
    _getCurrentWeatherCubit = DependencyInjection.DI<GetCurrentWeatherCubit>();
    _getCurrentWeatherCubit.getCurrentWeatherWithCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _getCurrentWeatherCubit,
      child: BlocListener<GetCurrentWeatherCubit, GetCurrentWeatherState>(
        listener: (context, state) {
          if (state is GetCurrentWeatherError) {
            ToastUtils.showToastError(context, state.message);
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: const BasicScaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CurrentPositionAndSearchSection(),
                CurrentWeatherInformationSection(),
                ForecastsTodaySection(),
                NextForecastsSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
