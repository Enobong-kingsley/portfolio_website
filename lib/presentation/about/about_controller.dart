import 'dart:math';

import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:either_dart/either.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:miladjalali_ir/presentation/widgets/custom_snackbar.dart';
import 'package:miladjalali_ir/app/util/video_player_data_manager.dart';
import 'package:miladjalali_ir/domain/entities/unsplash_image.dart';
import 'package:miladjalali_ir/domain/entities/unsplash_image_urls.dart';
import 'package:miladjalali_ir/domain/entities/unsplash_search_response.dart';
import 'package:miladjalali_ir/domain/usecases/fetch_person_images_use_case.dart';
import 'package:tuple/tuple.dart';
import 'package:video_player/video_player.dart';

class AboutController extends GetxController with GetTickerProviderStateMixin {
  AboutController(this._fetchPersonImagesUseCase);

  late int itemSize;
  late int itemsInEachRow;
  late int visibleRowsCount;

  late FetchPersonImagesUseCase _fetchPersonImagesUseCase;
  int _currentPage = Random().nextInt(5);
  int _pageSize = 100;
  var unsplashSearchResponse = Rx<UnsplashSearchResponse?>(null);
  var images = RxList<UnsplashImage>([]);
  var _isLoadMore = false;
  ScrollController scrollController = ScrollController();

  late FlickManager flickManager;
  late VideoPlayerDataManager? dataManager;

  @override
  void onInit() {
    super.onInit();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.network("https://miladjalali.ir/about_me.mp4"), autoPlay: false);

    dataManager = VideoPlayerDataManager(flickManager: flickManager, urls: ["https://miladjalali.ir/about_me.mp4"]);
  }

  @override
  void onReady() {
    if (Get.width < 768)
      itemSize = 64;
    else
      itemSize = 200;
    itemsInEachRow = (Get.width / itemSize).floor();
    visibleRowsCount = (Get.height / itemSize).floor();

    fetchPersonImages();
    scrollController.addListener(_scrollListener);

    super.onReady();
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    flickManager.dispose();
    super.dispose();
  }

  fetchPersonImages() async {
    Either response = await _fetchPersonImagesUseCase.execute(Tuple2(_currentPage, _pageSize));
    response.fold((left) {
      CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
    }, (right) {
      UnsplashSearchResponse newResponse = right;
      List<UnsplashImage>? temp = newResponse.results;
      images.assignAll(temp!);
      unsplashSearchResponse.value = newResponse;
      addMyPhoto();
      checkScreenFilledWithImages();
    });
  }

  checkScreenFilledWithImages() {
    if (images.length < visibleRowsCount * itemsInEachRow) {
      loadMore();
    }
  }

  loadMore() async {
    final totalResults = unsplashSearchResponse.value?.total ?? 0;
    if (totalResults / _pageSize <= _currentPage) return;
    if (_isLoadMore) return;
    _isLoadMore = true;

    Either newResponse = await _fetchPersonImagesUseCase.execute(Tuple2(++_currentPage, _pageSize));
    newResponse.fold((left) {
      CustomSnackBar.show(Get.context!, left.message, ContentType.failure);
    }, (right) {
      images.addAll(right.results!);
      unsplashSearchResponse.value?.total = right.total;
      _isLoadMore = false;
      checkScreenFilledWithImages();
    });
  }

  void _scrollListener() {
    if (scrollController.hasClients) {
      if (scrollController.position.maxScrollExtent == scrollController.offset) {
        print("load more");
        loadMore();
      }
    }
  }

  void addMyPhoto() {
    int position = ((visibleRowsCount / 5).floor() * itemsInEachRow) +
        Random().nextInt((itemsInEachRow ~/ 5)) +
        (itemsInEachRow / 5).ceil();

    if (position > images.length) position = Random().nextInt(itemsInEachRow) + itemsInEachRow;

    images.insert(
        position,
        UnsplashImage(
            urls: UnsplashImageUrls(small: "https://media.licdn.com/dms/image/C4D03AQH-pOTGHY_13w/profile-displayphoto-shrink_800_800/0/1652014718823?e=1687996800&v=beta&t=6V4SIyowsQL3DXgqoN82oiXH7V02pWEri0OAtT3MWM8"),
            blurHash: "LPGcGlkWK+w[_Noes8NG.TRjRQt7"));
  }
}
