import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar_category.dart';

class VitaminScreen extends StatelessWidget {
  const VitaminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbarCategory(title: "Vitamin Medicines"),

    );
  }
}
