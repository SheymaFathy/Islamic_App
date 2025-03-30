import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:islamic_app/core/helper/shared_preference/cache_helper.dart';
import 'package:islamic_app/core/routes/routes.dart';
import 'package:islamic_app/features/azkar/presentation/view_model/azkar_cubit.dart';
import 'features/azkar/data/repo/azkar_repo.dart';
import 'features/prayer_times/data/repo/prayer_tomes_repo.dart';
import 'features/prayer_times/presentation/view_model/prayer_times_cubit.dart';

import 'features/main_screen/presentation/view_model/main_screen_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ar');
  await CacheHelper.init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainScreenCubit()),
        BlocProvider(
          create: (context) => PrayerTimeCubit(PrayerTimeRepository()),
        ),
        BlocProvider(create: (context) => AdhkarCubit(AdhkarRepository())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      title: 'Islamic App',
      theme: ThemeData(fontFamily: 'Cairo'),
    );
  }
}
