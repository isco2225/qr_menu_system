import 'package:flutter/material.dart';

extension ScrollControllerExtension on ScrollController {
  void onScrollEnd(
    void Function() onScrollEnd,
  ) {
    addListener(() {
      if (position.pixels >= position.maxScrollExtent) {
        onScrollEnd();
      }
    });
  }
}
