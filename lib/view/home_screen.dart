import 'package:flutter/material.dart';
import 'package:interviewapp/utils/constants/assets_constants.dart';
import 'package:interviewapp/utils/constants/color_constants.dart';
import 'package:interviewapp/utils/constants/string_constants.dart';
import 'package:interviewapp/utils/widgets/text_widget.dart';
import 'package:interviewapp/utils/widgets/textfield_widget.dart';
import 'package:interviewapp/utils/widgets/weather_info_widget.dart';
import 'package:interviewapp/view/past_day_info_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../providers/weather_provider.dart';
import 'history_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        foregroundColor: ColorConstants.whiteColor,
        surfaceTintColor: ColorConstants.whiteColor,
        title: TextWidget(
          StringConstants.appName,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.history,
              color: ColorConstants.blackColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
          IconButton(
            color: ColorConstants.blackColor,
            icon: Icon(
              Icons.swap_horiz,
            ),
            onPressed: () {
              weatherProvider.toggleUnit();
              weatherProvider.fetchWeather();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              TextfieldWidget(
                textEditingController: searchController,
                onSubmit: (value) {
                  weatherProvider.setCity(value);
                  weatherProvider.fetchWeather();
                },
              ),
              SizedBox(height: 4.h),
              if (weatherProvider.isLoading)
                Center(
                  child: Lottie.asset(AssetsConstants.searchFieldLottie,
                      height: 50.h),
                ),
              if (weatherProvider.weatherDataModel == null &&
                  !weatherProvider.isLoading)
                Center(
                  child: TextWidget(
                    StringConstants.initialText,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              if (!weatherProvider.isLoading &&
                  weatherProvider.weatherDataModel != null) ...[
                WeatherInfoWidget(
                    weatherDataModel: weatherProvider.weatherDataModel!),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: weatherProvider.weatherDataModel == null ||
              weatherProvider.isLoading
          ? SizedBox()
          : InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PastDayInfoScreen(
                      weatherDataModel: weatherProvider.weatherDataModel!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 0),
                child: Container(
                  width: 100.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                      color: ColorConstants.blueColor,
                      borderRadius: BorderRadius.circular(16)),
                  child: Center(
                    child: TextWidget(
                      StringConstants.pastDay,
                      fontSize: 16,
                      height: 0,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
