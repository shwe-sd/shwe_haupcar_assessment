import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/language_constants.dart';
import 'presentation/screens/category_screen.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/product/product_bloc.dart';
// import 'blocs/locale/locale_bloc.dart';
import 'core/services/api_service.dart';
import 'app.dart';

void main() {
  runApp(
    RepositoryProvider<ApiService>(
      create: (context) => ApiService(),
      child: MyApp(),
    ),
  );
}

