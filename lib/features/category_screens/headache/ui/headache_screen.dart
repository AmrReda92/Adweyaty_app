import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar_category.dart';

class HeadacheScreen extends StatelessWidget {
  const HeadacheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(title: "Headache Medicines"),

    );
  }
}
