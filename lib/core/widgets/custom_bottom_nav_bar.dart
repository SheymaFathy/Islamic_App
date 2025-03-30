import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic_app/features/main_screen/presentation/view_model/main_screen_cubit.dart';
import 'package:islamic_app/features/main_screen/presentation/view_model/main_screen_state.dart';
import 'package:islamic_app/core/constants/colors.dart'; // تأكد من أن لديك ملف الألوان

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainScreenCubit, MainScreenState>(
      builder: (context, state) {
        final cubit = context.watch<MainScreenCubit>();

        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index) {
            cubit.changeTab(index);
          },
          selectedItemColor: AppColors.primary, // لون العنصر المحدد
          unselectedItemColor: Colors.grey, // لون العناصر غير المحددة
          items: const [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.starAndCrescent ), // أيقونة الرئيسية
              label: "الرئيسية",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.mosque), // أيقونة مواقيت الصلاة
              label: "مواقيت الصلاة",
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.handHoldingHeart  ), // ✅ تغيير الأيقونة إلى شكل المسبحة
              label: "تسابيح", // ✅ تغيير الاسم
            ),
          ],
        );
      },
    );
  }
}
