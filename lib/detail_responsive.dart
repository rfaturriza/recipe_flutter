import 'package:dicoding_submission/detail.dart';
import 'package:dicoding_submission/model.dart';
import 'package:flutter/material.dart';

class DetailResponsive extends StatelessWidget {
  final RecipeModel? data;
  DetailResponsive({this.data});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 900) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth / 8),
            child: DetailPage(
              data: data,
            ),
          ),
        );
      } else {
        return DetailPage(data: data);
      }
    });
  }
}
