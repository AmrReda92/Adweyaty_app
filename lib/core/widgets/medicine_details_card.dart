import 'package:adweyaty_application/features/product_screens/data/models/drug_item_details.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/core/widgets/custom_elvated_button_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MedicineDetailsCard extends StatefulWidget {
  final DrugItemDetails drugItem ;
  const MedicineDetailsCard({super.key, required this.drugItem});

  @override
  State<MedicineDetailsCard> createState() => _MedicineDetailsCardState();
}

class _MedicineDetailsCardState extends State<MedicineDetailsCard> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 5.w,right: 5.w,),
      child: Card(
        elevation: 6,
        color: Colors.blue.shade200,
        child: Padding(
          padding:  EdgeInsets.only(left: 14.w,right:14.w,top: 12.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 26.w,
                  height: 26.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),child: GestureDetector(
                     onTap: (){
                       setState(() {
                         isSelected = !isSelected;

                       });
                     },
                    child: isSelected? Icon(Icons.favorite,size: 20,color: Colors.red,) : Icon(Icons.favorite_border,size: 20,)
                ),
                ),
              ),
              CachedNetworkImage(imageUrl:widget.drugItem.image ,fit:BoxFit.contain, height: 100.h,),
              Text(widget.drugItem.name,style: AppTextStyle.medicineName,maxLines:1,overflow:TextOverflow.ellipsis ),
              Text(("${widget.drugItem.price} EGP"),style: AppTextStyle.price,),
              SizedBox(
                    width: double.infinity,
                    child: CustomElvatedButtonCard()
                  ),

            ],
          ),
        ),
      ),
    );
  }
}
