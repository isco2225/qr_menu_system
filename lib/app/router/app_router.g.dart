// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $categoriesRoute,
  $productsRoute,
  $signInRoute,
  $adminShellRoute,
];

RouteBase get $categoriesRoute => GoRouteData.$route(
  path: '/',

  factory: $CategoriesRouteExtension._fromState,
);

extension $CategoriesRouteExtension on CategoriesRoute {
  static CategoriesRoute _fromState(GoRouterState state) =>
      const CategoriesRoute();

  String get location => GoRouteData.$location('/');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $productsRoute => GoRouteData.$route(
  path: '/categories/:categoryId/products',

  factory: $ProductsRouteExtension._fromState,
);

extension $ProductsRouteExtension on ProductsRoute {
  static ProductsRoute _fromState(GoRouterState state) =>
      ProductsRoute(categoryId: state.pathParameters['categoryId']!);

  String get location => GoRouteData.$location(
    '/categories/${Uri.encodeComponent(categoryId)}/products',
  );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signInRoute => GoRouteData.$route(
  path: '/sign-in',

  factory: $SignInRouteExtension._fromState,
);

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location('/sign-in');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $adminShellRoute => StatefulShellRouteData.$route(
  factory: $AdminShellRouteExtension._fromState,
  branches: [
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/dashboard',

          factory: $AdminDashboardRouteExtension._fromState,
        ),
      ],
    ),
    StatefulShellBranchData.$branch(
      routes: [
        GoRouteData.$route(
          path: '/admin/categories',

          factory: $AdminCategoriesRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: '/admin/category/create',

          factory: $CreateCategoryRouteExtension._fromState,
        ),
      ],
    ),
  ],
);

extension $AdminShellRouteExtension on AdminShellRoute {
  static AdminShellRoute _fromState(GoRouterState state) =>
      const AdminShellRoute();
}

extension $AdminDashboardRouteExtension on AdminDashboardRoute {
  static AdminDashboardRoute _fromState(GoRouterState state) =>
      const AdminDashboardRoute();

  String get location => GoRouteData.$location('/admin/dashboard');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AdminCategoriesRouteExtension on AdminCategoriesRoute {
  static AdminCategoriesRoute _fromState(GoRouterState state) =>
      const AdminCategoriesRoute();

  String get location => GoRouteData.$location('/admin/categories');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $CreateCategoryRouteExtension on CreateCategoryRoute {
  static CreateCategoryRoute _fromState(GoRouterState state) =>
      const CreateCategoryRoute();

  String get location => GoRouteData.$location('/admin/category/create');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
