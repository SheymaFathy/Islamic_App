// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:islamic_app/core/constants/colors.dart';
import 'package:islamic_app/core/constants/styles.dart';
import 'package:islamic_app/core/widgets/custom_scaffold_background.dart';
import 'package:islamic_app/features/azkar/presentation/view/azkar_screen.dart';
import 'package:islamic_app/features/azkar/presentation/view_model/azkar_cubit.dart';

import '../view_model/azkar_state.dart';

class AdhkarCategoryScreen extends StatefulWidget {
  const AdhkarCategoryScreen({super.key});

  @override
  _AdhkarCategoryScreenState createState() => _AdhkarCategoryScreenState();
}

class _AdhkarCategoryScreenState extends State<AdhkarCategoryScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AdhkarCubit>().loadAdhkar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          CustomScaffoldBackground(),
          Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Center(
                child: Text(
                  "الأذكار",
                  style: AppStyles.title,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: BlocBuilder<AdhkarCubit, AdhkarState>(
                  builder: (context, state) {
                    if (state is AdhkarLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is AdhkarLoaded) {
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:1,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                        ),
                        itemCount: state.adhkar.length,
                        itemBuilder: (context, index) {
                          final category = state.adhkar[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AdhkarScreen(category: category),
                                ),
                              );
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(FontAwesomeIcons.starAndCrescent,color: AppColors.primary,size: 40, ),
                                  SizedBox(height: 10,),
                                  Center(
                                    child: Text(
                                      category.title,
                                      textAlign: TextAlign.center,
                                      style: AppStyles.subtitle.copyWith(fontSize: 15, overflow: TextOverflow.ellipsis),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );

                    } else if (state is AdhkarError) {
                      return Center(child: Text(state.message));
                    }
                    return Center(child: Text("لا توجد بيانات"));
                  },
                ),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
