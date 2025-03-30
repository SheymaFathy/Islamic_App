import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/features/main_screen/presentation/view_model/main_screen_cubit.dart';
import 'package:islamic_app/features/main_screen/presentation/view_model/main_screen_state.dart';
import 'package:islamic_app/core/widgets/custom_bottom_nav_bar.dart';
import '../../../azkar/presentation/view/azkar_category.dart';
import '../../../prayer_times/presentation/view/prayer_times_screen.dart';
import '../../../tasbeeh/presentation/view/tasbeeh_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        final cubit = context.read<MainScreenCubit>();
        final List<Widget> pages = [
          AdhkarCategoryScreen(),
          PrayerTimeView(),
          TasbeehScreen(),
        ];

        return Scaffold(
          body: IndexedStack(
            index: cubit.currentIndex,
            children: pages,
          ),
          bottomNavigationBar: CustomBottomNav(),
        );
      },
    );
  }
}
