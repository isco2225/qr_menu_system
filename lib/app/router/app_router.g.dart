// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
  $categoriesRoute,
  $productsRoute,
  $adminPanelRoute,
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

RouteBase get $adminPanelRoute => GoRouteData.$route(
  path: '/admin-panel',

  factory: $AdminPanelRouteExtension._fromState,
);

extension $AdminPanelRouteExtension on AdminPanelRoute {
  static AdminPanelRoute _fromState(GoRouterState state) =>
      const AdminPanelRoute();

  String get location => GoRouteData.$location('/admin-panel');

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
