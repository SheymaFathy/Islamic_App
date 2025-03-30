import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/core/widgets/custom_scaffold_background.dart';
import 'package:islamic_app/features/tasbeeh/presentation/view/widget/tasbeeh_counter_widget.dart';
import '../view_model/tasbeeh_cubit.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TasbeehCubit(),
      child: Scaffold(
        body: Stack(children: [CustomScaffoldBackground(), TasbeehCounter()]),
      ),
    );
  }
}
