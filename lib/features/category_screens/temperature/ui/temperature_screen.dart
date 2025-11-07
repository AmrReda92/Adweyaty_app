import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar_category.dart';

class TemperatureScreen extends StatelessWidget {
  const TemperatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(title: "Temperature Medicines"),


    );
  }
}
