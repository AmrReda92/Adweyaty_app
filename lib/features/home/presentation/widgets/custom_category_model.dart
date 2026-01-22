import 'package:adweyaty_application/core/theme/app_color.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../generated/l10n.dart';
import '../../data/model/homeCategoryModel.dart';

class CustomCategoryModel extends StatelessWidget {
  final HomeCategoryModel category ;


  const CustomCategoryModel({super.key, required this.category,});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              height: 180.h,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(image: CachedNetworkImageProvider(category.image),fit: BoxFit.cover)
              ),
            ),
          ),
          SizedBox(
            height: 25.h ,
            child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.r),bottomRight: Radius.circular(12.r),),
                  gradient: AppColor.customElevated ,
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 4.w),
                  child: Text(category.title,maxLines:1 , overflow :TextOverflow.ellipsis ,style: AppTextStyle.font20black.copyWith(color:Colors.white,fontSize: 18),textAlign: TextAlign.center,),
                )),
          )
        ],

      ),
    );
  }
}
