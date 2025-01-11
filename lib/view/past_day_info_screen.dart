import 'package:flutter/material.dart';
import 'package:interviewapp/model/weather_model.dart';
import 'package:interviewapp/providers/weather_provider.dart';
import 'package:interviewapp/utils/constants/assets_constants.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';
import 'package:interviewapp/utils/constants/string_constants.dart';
import 'package:interviewapp/utils/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class PastDayInfoScreen extends StatelessWidget {
  const PastDayInfoScreen({super.key, required this.weatherDataModel});

  final WeatherDataModel weatherDataModel;

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
          '${StringConstants.pastDay} - ${weatherDataModel.address.toString()}',
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: weatherDataModel.days!.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: ColorConstants.containerGradient),
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
                            ? "${weatherDataModel.days![index].temp!.toString()} °C"
                            : "${weatherDataModel.days![index].temp!.toString()} °F",
                        fontSize: 30,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.whiteColor,
                      ),
                    ),
                    Image.asset(
                      weatherDataModel.days![index].conditions == "Clear"
                          ? AssetsConstants.sunSlowRainImage
                          : weatherDataModel.days![index].conditions ==
                                  "Overcast"
                              ? AssetsConstants.windImage
                              : AssetsConstants.nightRainImage,
                      height: 13.h,
                      width: 26.w,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                TextWidget(
                  'Date : ${weatherDataModel.days![index].datetime.toString()}',
                  fontSize: 18.5,
                  height: 0,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                TextWidget(
                  'Humidity : ${weatherDataModel.days![index].humidity.toString()} %',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Weather Condition : ${weatherDataModel.days![index].conditions.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Dew in Weather : ${weatherDataModel.days![index].dew.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Snow : ${weatherDataModel.days![index].snow.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Wind Speed : ${weatherDataModel.days![index].windspeed.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Pressure in Air : ${weatherDataModel.days![index].pressure.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Visibility : ${weatherDataModel.days![index].visibility.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'UVI Index : ${weatherDataModel.days![index].uvindex.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 1.0.h,
                ),
                TextWidget(
                  'Solar Radiation : ${weatherDataModel.days![index].solarradiation.toString()}',
                  fontSize: 16,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.whiteColor,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
