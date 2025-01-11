import 'package:flutter/material.dart';
import 'package:interviewapp/model/weather_model.dart';
import 'package:interviewapp/providers/weather_provider.dart';
import 'package:interviewapp/utils/constants/assets_constants.dart';
import 'package:interviewapp/utils/widgets/text_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';

class WeatherInfoWidget extends StatefulWidget {
  final WeatherDataModel weatherDataModel;
  const WeatherInfoWidget({super.key, required this.weatherDataModel});

  @override
  State<WeatherInfoWidget> createState() => _WeatherInfoWidgetState();
}

class _WeatherInfoWidgetState extends State<WeatherInfoWidget> {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    widget.weatherDataModel.resolvedAddress!,
                    fontSize: 19.sp,
                    textAlign: TextAlign.start,
                    textOverflow: TextOverflow.ellipsis,
                    maxLine: 2,
                    fontWeight: FontWeight.bold,
                  ),
                  SizedBox(height: 0.5.h),
                  TextWidget(
                    widget.weatherDataModel.timezone!,
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  TextWidget(
                    getTodayDate(),
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                AssetsConstants.mapImage,
                fit: BoxFit.cover,
                height: 12.h,
                width: 24.w,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Colors.blue[200]!,
                  Colors.blue[100]!,
                ],
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.white, Colors.white54],
                        ).createShader(bounds);
                      },
                      child: TextWidget(
                        weatherProvider.unit == "metric"
                            ? "${widget.weatherDataModel.currentConditions!.temp!.toString()} °C"
                            : "${widget.weatherDataModel.currentConditions!.temp!.toString()} °F",
                        fontSize: 30,
                        height: 0,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.whiteColor,
                      )),
                  Image.asset(
                    widget.weatherDataModel.currentConditions!.conditions ==
                            "Clear"
                        ? AssetsConstants.sunSlowRainImage
                        : widget.weatherDataModel.currentConditions!
                                    .conditions ==
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
                widget.weatherDataModel.description!.toString(),
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
                'Humidity : ${widget.weatherDataModel.currentConditions!.humidity.toString()} %',
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
                'Weather Condition : ${widget.weatherDataModel.currentConditions!.conditions.toString()}',
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
                'Dew in Weather : ${widget.weatherDataModel.currentConditions!.dew.toString()}',
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
                'Snow : ${widget.weatherDataModel.currentConditions!.snow.toString()}',
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
                'Wind Speed : ${widget.weatherDataModel.currentConditions!.windspeed.toString()}',
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
                'Pressure in Air : ${widget.weatherDataModel.currentConditions!.pressure.toString()}',
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
                'Visibility : ${widget.weatherDataModel.currentConditions!.visibility.toString()}',
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
                'UVI Index : ${widget.weatherDataModel.currentConditions!.uvindex.toString()}',
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
                'Solar Radiation : ${widget.weatherDataModel.currentConditions!.solarradiation.toString()}',
                fontSize: 16,
                height: 0,
                fontWeight: FontWeight.w600,
                color: ColorConstants.whiteColor,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }

  String getTodayDate() {
    var now = DateTime.now();
    var formatter = DateFormat('dd MMM yyyy');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}
