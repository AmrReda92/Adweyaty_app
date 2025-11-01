import 'package:adweyaty_application/core/app_images/app_images.dart';
import 'package:adweyaty_application/core/theme/app_text_style.dart';
import 'package:adweyaty_application/features/home/data/model/homeCategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});


  final List<HomeCategoryModel> categories =
  [
    HomeCategoryModel(image: AppImages.bloodPressure,title: "pressure medicines"),
    HomeCategoryModel(image: AppImages.coughPerson, title: "cough medicines"),
    HomeCategoryModel(image: AppImages.headache, title: "headache medicines"),
    HomeCategoryModel(image: AppImages.temperature, title: "temperature medicines"),
    HomeCategoryModel(image: AppImages.womanProduct, title: "woman medicines"),
    HomeCategoryModel(image: AppImages.vitamin, title: "vitamin medicines"),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          leading: SvgPicture.asset(AppImages.cartIcon,),
          actions: [
            Icon(Icons.list,size: 40,)
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",style: AppTextStyle.font20,),
                    Text("Show All",style: AppTextStyle.font20,),
                  ],
                ),
                SizedBox(height: 20.h,),
                SizedBox(
                  height: .4.sh,
                  child: GridView.builder(
                       scrollDirection: Axis.horizontal,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        childAspectRatio: 1,
                      ),
                      itemCount: categories.length,
                      itemBuilder: (context,index) {
                         return Container(
                            height: 100.h,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(image: AssetImage(categories[index].image),fit: BoxFit.cover)
                            ),
                            child:
                            Container(
                                width: double.infinity,
                                child: Text(categories[index].title,style: AppTextStyle.font20,textAlign: TextAlign.center,))
                                                      );
                      }
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
