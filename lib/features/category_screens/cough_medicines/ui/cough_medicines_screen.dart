import 'package:adweyaty_application/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class CoughMedicinesScreen extends StatelessWidget {
  const CoughMedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text("Cough Medicines") ,
      ),
    );
  }
}
