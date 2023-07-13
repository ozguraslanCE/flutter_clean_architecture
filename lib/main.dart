import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/src/config/router/app_router.dart';
import 'package:flutter_clean_architecture/src/domain/repositories/api_repository.dart';
import 'package:flutter_clean_architecture/src/locator.dart';
import 'package:flutter_clean_architecture/src/presentation/cubits/remote_articles/remote_articles_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RemoteArticlesCubit(
            locator<ApiRepository>(),
          )..getBreakingNewsArticles(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
