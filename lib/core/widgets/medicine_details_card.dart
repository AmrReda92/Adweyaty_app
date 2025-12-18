import 'package:adweyaty_application/features/product_screens/data/models/drug_item_details.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_elvated_button_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MedicineDetailsCard extends StatelessWidget {
  final DrugItemDetails drugItem ;
  const MedicineDetailsCard({super.key, required this.drugItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 5.w,),
      child: Card(
        elevation: 6,
        color: Colors.white,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(imageUrl:drugItem.image ,fit:BoxFit.cover, height: 100.h,),
              SizedBox(height: 6.h,),
              Text(drugItem.name,style: AppTextStyle.medicineName,),
              SizedBox(height: 6.h,),
              Text(drugItem.price.toString(),style: AppTextStyle.price,),
              SizedBox(height: 6.h,),
              SizedBox(
                width: double.infinity,
                child: CustomElvatedButtonCard()
              )
            ],
          ),
        ),
      ),
    );
  }
}
