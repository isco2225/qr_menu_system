import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu_system/data/data.dart';

import '../../ui/ui.dart';

part 'app_router.g.dart';

// -------------------- PUBLIC ROUTES --------------------

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
  final String categoryId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProductsScreen(categoryId: categoryId);
  }
}

// -------------------- ADMIN SIGN-IN --------------------

@TypedGoRoute<SignInRoute>(path: '/sign-in')
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

// -------------------- ADMIN LAYOUT (StatefulShell) --------------------

@TypedStatefulShellRoute<AdminShellRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [TypedGoRoute<AdminDashboardRoute>(path: '/admin/dashboard')],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<AdminCategoriesRoute>(path: '/admin/categories'),
        TypedGoRoute<CreateCategoryRoute>(path: '/admin/category/create'),
      ],
    ),
  ],
)
class AdminShellRoute extends StatefulShellRouteData {
  const AdminShellRoute();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return AdminScreen(navigationShell: navigationShell);
  }
}

// -------------------- ADMIN BRANCH ROUTES --------------------

class AdminDashboardRoute extends GoRouteData {
  const AdminDashboardRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminDashboardScreen();
}

class AdminCategoriesRoute extends GoRouteData {
  const AdminCategoriesRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CategoryScreen();
}

class CreateCategoryRoute extends GoRouteData {
  const CreateCategoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateCategoryScreen();
}

// -------------------- ROUTER CONFIG --------------------

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  initialLocation: '/',
  routerNeglect: false,
  redirect: (BuildContext context, GoRouterState state) {
    final isSignedIn = context.read<AdminRepository>().admin.value?.uid != null;
    final bool isAdminRoute = state.uri.path.startsWith('/admin');

    if (isAdminRoute && !isSignedIn) return '/sign-in';

    if (state.fullPath == '/sign-in' && isSignedIn) return '/admin/dashboard';

    return null;
  },
);
