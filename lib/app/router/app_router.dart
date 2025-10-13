import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../ui/ui.dart';

part 'app_router.g.dart';

@TypedGoRoute<CategoriesRoute>(path: '/')
class CategoriesRoute extends GoRouteData {
  const CategoriesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CategoriesScreen();
}

@TypedGoRoute<ProductsRoute>(path: '/categories/:categoryId/products')
class ProductsRoute extends GoRouteData {
  const ProductsRoute({required this.categoryId});
  final int categoryId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductsScreen(categoryId: categoryId);
  }
}

@TypedGoRoute<AdminPanelRoute>(path: '/admin-panel')
class AdminPanelRoute extends GoRouteData {
  const AdminPanelRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return AdminPanelScreen();
  }
}

final GoRouter appRouter = GoRouter(routes: $appRoutes);
