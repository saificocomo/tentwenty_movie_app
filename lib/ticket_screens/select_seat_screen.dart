import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ten_twenty_movie_app/ticket_screens/book_seat_screen.dart';
import 'package:ten_twenty_movie_app/utlis/app_color.dart';

import '../reusable_widgets/custom_button.dart';

class SelectSeatScreen extends StatelessWidget {
  const SelectSeatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.liteWhiteColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Center(
          child: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.whiteColor,
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.navBarColor,
              ),
            ),
            title: Column(
              children: [
                Text(
                  "The King’s Man",
                  style: TextStyle(fontSize: 16, color: AppColors.navBarColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "In theaters december 22, 2021",
                      style: TextStyle(
                          fontSize: 12, color: AppColors.liteBlueColor),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Date",
              style: TextStyle(fontSize: 16, color: AppColors.navBarColor),
            ),
            DefaultTabController(
              length: 7, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    child: TabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: AppColors.whiteColor,
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.liteBlueColor),
                      tabs: const [
                        Tab(text: '5 Mar'),
                        Tab(text: '6 Mar'),
                        Tab(text: '7 Mar'),
                        Tab(text: '8 Mar'),
                        Tab(text: '9 Mar'),
                        Tab(text: '10 Mar'),
                        Tab(text: '11 Mar'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
          onTap: () {
            Get.to(const BookSeatScreen());
          },
          child: CustomButton(buttonText: "Select Seats", buttonWidth: 0.90)),
    );
  }
}
