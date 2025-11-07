import 'package:adweyaty_application/core/models/card_items.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_appbar_category.dart';
import 'package:adweyaty_application/core/widgets/custom_button.dart';
import 'package:adweyaty_application/core/widgets/custom_elevated_button.dart';
import 'package:adweyaty_application/core/widgets/medicine_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_images/app_images.dart';

class CoughMedicinesScreen extends StatelessWidget {
  const CoughMedicinesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4f4),
      appBar: CustomAppbarCategory(title: "Cough Medicines"),
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20.h,
                crossAxisSpacing: 14.w,
                childAspectRatio: .75
            ),
            itemCount: cardItem.length,
            itemBuilder: (context,index)=>MedicineDetailsCard(
                image: cardItem[index].image,
                name:  cardItem[index].name,
                price:  cardItem[index].price,)
        )


    );
  }
}
