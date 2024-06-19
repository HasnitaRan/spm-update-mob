import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../homepage/widgets/home_page_widgets.dart';
import 'calendar_provider.dart';

class HomePage extends StatelessWidget {
  final ValueNotifier<bool> _selectDateNotifier = ValueNotifier<bool>(true);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          boxInfo(context),
          buttonTheme(context),
          boxStartTerapi(context),
          Positioned(
            bottom: 165.h,
            left: 12.w,
            right: 12.w,
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                  List.generate(
                    7,
                    (index) => ScheduleTerapi(day: "Mo", selectDate: _selectDateNotifier, onTap: (){
                      _selectDateNotifier.value = !_selectDateNotifier.value;
                    },),
                  ),
                  // SizedBox(width: 5.w),
                  // ScheduleTerapi("T"),
                  // SizedBox(width: 5.w),
                  // scheduleTerapi("M"),
                  // SizedBox(width: 5.w),
                  // scheduleTerapi("T"),
                  // SizedBox(width: 5.w),
                  // scheduleTerapi("M"),
                  // SizedBox(width: 5.w),
                  // scheduleTerapi("T"),
                  // SizedBox(width: 5.w),
                  // scheduleTerapi("T"),
              ),
            ),
          ),
          SizedBox(height: 20.h,),
          Positioned(
            bottom: 23.h,
              left: 12.w,
              right: 12.w,
              child: boxMenu(context, "W")),

        ],
      ),
    );
  }
}
