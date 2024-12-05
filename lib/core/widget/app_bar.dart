import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

AppBar appBar({required final String title}) {
  return AppBar(
    elevation: 0.0,
    leading: const Icon(Icons.arrow_back_outlined),
    centerTitle: true,
    title: Text(
      title,
      style: AppStyles.style25,
    ),
  );
}
