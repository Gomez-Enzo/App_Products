import 'package:app_products/home/views/home_page.dart';
import 'package:app_products/l10n/l10n.dart';
import 'package:app_products/login/views/login_page.dart';
import 'package:app_products/products/views/create_products_page.dart';
import 'package:appsize/appsize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:products_client/products_client.dart';

class PageApp extends StatelessWidget {
  const PageApp({super.key});

  @override
  Widget build(BuildContext context) {
    final productsClient = ProductsClient();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: productsClient),
      ],
      child: const ViewApp(),
    );
  }
}

class ViewApp extends StatefulWidget {
  const ViewApp({super.key});

  @override
  State<ViewApp> createState() => _ViewAppState();
}

class _ViewAppState extends State<ViewApp> {
  late final GoRouter _router;
  @override
  void initState() {
    super.initState();
    _router = router();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: AppBarTheme(
          elevation: 5,
          color: Colors.indigo,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.indigo,
          elevation: 5,
        ),
      ),
      builder: (context, child) => AppSize.child(
        child: child!,
      ),
    );
  }

  GoRouter router() {
    return GoRouter(
      errorBuilder: (context, state) => RoutingErrorPage(state.path),
      initialLocation: '/home',
      routes: <GoRoute>[
        GoRoute(
          path: '/login',
          name: LoginPage.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/home',
          name: HomePage.name,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/products',
          name: CreateProductsPage.name,
          builder: (context, state) => const CreateProductsPage(),
        )
      ],
    );
  }
}

class RoutingErrorPage extends StatelessWidget {
  const RoutingErrorPage(this.path, {super.key});

  final String? path;

  @override
  Widget build(BuildContext context) {
    final phrase = context.l10n.noRoutesForLocation(
      path ?? context.l10n.unknownPath,
    );

    return Scaffold(
      body: Center(
        child: Text(
          phrase,
        ),
      ),
    );
  }
}
