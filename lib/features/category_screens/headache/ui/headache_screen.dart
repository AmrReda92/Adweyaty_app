import 'package:flutter/material.dart';

class HeadacheScreen extends StatelessWidget {
  const HeadacheScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true ,
        title: Text("Headache Medicines") ,
      ),
    );
  }
}
