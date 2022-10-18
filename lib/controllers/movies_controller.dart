import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../http_services/http_services.dart';

class MoviesController extends GetxController {
  HttpService httpService = HttpService();

  List upComingMoviesList = [];
  List movieDetailsList = [];
  bool isLoading = false;
  @override
  void onInit() {
    // TODO: implement onInit
    getUpComingMovies();
    getMovieDetails(571468);
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

  getMovieDetails(int id) async {
    isLoading = true;

    try {
      var response = await httpService.getMovieDetails(id);

      if (response == null) {
        debugPrint("No details");
      } else {
        // response?.forEach((element) {
        //   upComingMoviesList.add(element);
        // });

        movieDetailsList.add(response);
        print("movie details lsit ${movieDetailsList[0]}");
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
