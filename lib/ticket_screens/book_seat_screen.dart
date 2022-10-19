import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../reusable_widgets/custom_button.dart';
import '../reusable_widgets/seat_status.dart';
import '../utlis/app_color.dart';

class BookSeatScreen extends StatelessWidget {
  const BookSeatScreen({Key? key}) : super(key: key);

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "March 5, 2021  I  12:30 hall ",
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.10),
            Container(
              color: Colors.green,
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.45,
              child: const Text("effs"),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.54,
              height: MediaQuery.of(context).size.height * 0.060,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeatStatus(
                        status: "Selected",
                        color: AppColors.yellowColor,
                      ),
                      SeatStatus(
                        status: "Not available",
                        color: AppColors.liteGreyColor,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SeatStatus(
                        status: "VIP (150\$)",
                        color: AppColors.indigoColor,
                      ),
                      SeatStatus(
                        status: "Regular (50\$)",
                        color: AppColors.liteBlueColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.040,
              decoration: BoxDecoration(
                  color: const Color(0xffA6A6A6),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "4 / ",
                        style: TextStyle(
                            color: AppColors.navBarColor, fontSize: 14),
                      ),
                      Text(
                        "3 row",
                        style: TextStyle(
                            color: AppColors.navBarColor, fontSize: 10),
                      )
                    ],
                  ),
                  const Icon(Icons.close)
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.height * 0.065,
              decoration: BoxDecoration(
                  color: const Color(0xffA6A6A6),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Price",
                    style:
                        TextStyle(color: AppColors.navBarColor, fontSize: 14),
                  ),
                  Text(
                    "\$ 50",
                    style: TextStyle(
                        color: AppColors.navBarColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CustomButton(buttonText: "Select Seats", buttonWidth: 0.75),
          ],
        ),
      ),
    );
  }
}
