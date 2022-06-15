import 'package:fashion_paints/colors/colors_file.dart';
import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(
          color: ChooseColor(0).appBarColor1,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
