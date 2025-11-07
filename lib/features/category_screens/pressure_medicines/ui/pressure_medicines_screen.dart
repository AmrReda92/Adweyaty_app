import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_appbar_category.dart';

class PressureMedicinesScreen extends StatelessWidget {
  const PressureMedicinesScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarCategory(title: "Blood Pressure Medicines"),


    );
  }
}
