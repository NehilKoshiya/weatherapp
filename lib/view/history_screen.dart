import 'package:flutter/material.dart';
import 'package:interviewapp/utils/constants/assets_constants.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';
import 'package:interviewapp/utils/constants/string_constants.dart';
import 'package:interviewapp/utils/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/weather_provider.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        foregroundColor: ColorConstants.whiteColor,
        surfaceTintColor: ColorConstants.whiteColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: ColorConstants.blackColor,
            )),
        title: TextWidget(
          StringConstants.history,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: weatherProvider.searchHistory.length,
          itemBuilder: (context, index) {
            final entry = weatherProvider.searchHistory[index];
            return Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: ColorConstants.containerGradient,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return ColorConstants.shaderGradient
                                .createShader(bounds);
                          },
                          child: TextWidget(
                            weatherProvider.unit == "metric"
                                ? "${entry.currentConditions!.temp!.toString()} °C"
                                : "${entry.currentConditions!.temp!.toString()} °F",
                            fontSize: 30,
                            height: 0,
                            fontWeight: FontWeight.bold,
                            color: ColorConstants.whiteColor,
                          )),
                      Image.asset(
                        entry.currentConditions!.conditions == "Clear"
                            ? AssetsConstants.sunSlowRainImage
                            : entry.currentConditions!.conditions == "Overcast"
                                ? AssetsConstants.windImage
                                : AssetsConstants.nightRainImage,
                        height: 13.h,
                        width: 26.w,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  TextWidget(
                    '${StringConstants.cityName}${entry.resolvedAddress}',
                    fontSize: 18.5,
                    height: 0,
                    fontWeight: FontWeight.bold,
                    color: ColorConstants.whiteColor,
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
