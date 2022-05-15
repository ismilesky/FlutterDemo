import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/router/router.dart';
import 'core/viewmodels/favorite_view_model.dart';
import 'core/viewmodels/filter_view_model.dart';
import 'core/viewmodels/meal_view_model.dart';
import 'ui/shared/app_theme.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [ // 懒加载

        ChangeNotifierProvider(create: (ctx) => FCFilterViewModel()),

        // ChangeNotifierProxyProvider<T, R extends ChangeNotifier?>
        // 用于相互依赖 R依赖于T 

        ChangeNotifierProxyProvider<FCFilterViewModel, FCMealViewModel>(
          create: (ctx) => FCMealViewModel(),
          update: (ctx, filterVM, mealVM) {
            mealVM?.updateFilters(filterVM);
            return mealVM!;
          },
        ),
        
        ChangeNotifierProxyProvider<FCFilterViewModel, FCFavoriteViewModel>(
          create: (ctx) => FCFavoriteViewModel(),
          update: (ctx, filterVM, favorVM) {
            favorVM?.updateFilters(filterVM);
            return favorVM!;
          },
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '数字食谱',
      // 主题
      theme: FCAppTheme.norTheme,
      // 路由
      initialRoute: FCRouter.initialRoute,
      routes: FCRouter.routes,
      onGenerateRoute: FCRouter.generateRoute,
      onUnknownRoute: FCRouter.unknownRoute,
    );
  }
}