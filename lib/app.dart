import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'blocs/category/category_event.dart';
// import 'package:haupcar_assessment_shwe/blocs/category/category_event.dart';
import 'blocs/category/category_bloc.dart';
import 'blocs/locale/locale_bloc.dart';
import 'blocs/locale/locale_state.dart';
import 'blocs/product/product_bloc.dart';
// import 'blocs/locale/locale_bloc.dart';
import 'core/constants/language_constants.dart';
import 'core/services/api_service.dart';
import 'presentation/screens/category_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'generated/l10n.dart';
import 'core/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = RepositoryProvider.of<ApiService>(context);
    return MultiBlocProvider(
        providers: [
          BlocProvider<CategoryBloc>(
            create: (_) => CategoryBloc(apiService)..add(FetchCategories()),
          ),
          BlocProvider<ProductBloc>(
            create: (_) => ProductBloc(apiService),
          ),
          BlocProvider<LocaleBloc>(
            create: (_) => LocaleBloc(),
          ),
        ],
        child: BlocBuilder<LocaleBloc, LocaleState> (
          builder: (context, localeState) {
            return MaterialApp(
              title: 'Goods App',
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: ThemeMode.system,
              supportedLocales: supportedLocales,
              locale: localeState.locale, // ✅ apply selected locale
              // 🌐 Localization Config
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              home: CategoryScreen(),
              debugShowCheckedModeBanner: false,
            );
          }
        )
    );
  }
}
