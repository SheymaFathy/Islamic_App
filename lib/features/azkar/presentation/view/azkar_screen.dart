// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:islamic_app/core/constants/styles.dart';
import 'package:islamic_app/core/widgets/custom_scaffold_background.dart';
import 'package:islamic_app/features/azkar/data/model/adhkar_category_model.dart';

class AdhkarScreen extends StatelessWidget {
  final AdhkarCategory category;

  const AdhkarScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          CustomScaffoldBackground(),
          Padding(
            padding: EdgeInsets.all(10) ,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 190,),
              Center(
                child: Text(
                  category.title,
                  textAlign: TextAlign.center,
                  style: AppStyles.title.copyWith(
                    overflow: TextOverflow.clip,
                    fontSize: 20,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: category.adhkar.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(5),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Center(
                          child: Text(
                            category.adhkar[index].content,
                            textAlign: TextAlign.center,
                            style: AppStyles.body,
                          ),
                        ),
                      ),
                    );
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
