import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../http_services/http_services.dart';

class MoviesController extends GetxController {
  HttpService httpService = HttpService();

  List upComingMoviesList = [];
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    getUpComingMovies();
    super.onInit();
  }

  getUpComingMovies() async {
    isLoading = true;

    try {
      var response = await httpService.getUpComingMovies();

      if (response.results == null) {
        debugPrint("No data");
      } else {
        response.results?.forEach((element) {
          upComingMoviesList.add(element);
        });
        print("upcoming movies list ${upComingMoviesList[0].toString()}");
        update();
      }

      update();
    } catch (err) {
      if (kDebugMode) {
        print('Something went wrong in get movies $err');
        const CircularProgressIndicator();
      }
      update();
    }

    isLoading = false;
    update();
  }
}
