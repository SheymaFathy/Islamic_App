import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:islamic_app/core/constants/colors.dart';
import 'package:islamic_app/core/constants/styles.dart';
import '../../view_model/tasbeeh_cubit.dart';


class TasbeehCounter extends StatelessWidget {
  final List<String> tasbeehList = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله"
  ];

  TasbeehCounter({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<TasbeehCubit, List<int>>(
      builder: (context, counts) {
        final cubit = context.read<TasbeehCubit>();
        int currentIndex = cubit.currentTasbeehIndex;
        String arabicNumber = NumberFormat('###,###', 'ar_EG').format(counts[currentIndex]);

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                tasbeehList[currentIndex],
                style: AppStyles.title.copyWith(fontFamily: "fares", fontSize: 40),
              ),
              const SizedBox(height: 20),
              Text(
                arabicNumber,
                style:  AppStyles.title
              ),
              const SizedBox(height:15),
              ElevatedButton(
                onPressed: () => cubit.increment(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text("اضغط للتسبيح", style:AppStyles.subtitle)
              ),
              TextButton(
                onPressed: () => cubit.reset(),
                child: Text("إعادة التصفير", style: AppStyles.subtitle),
              ),
              const SizedBox(height:5),
              ElevatedButton(
                onPressed: () => cubit.nextTasbeeh(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                child: Text("التسبيح التالي", style:AppStyles.subtitle),
              ),
            ],
          ),
        );
      },
    );
  }
}
