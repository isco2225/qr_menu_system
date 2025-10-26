import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:qr_menu_system/data/data.dart';

import '../../ui/ui.dart';

part 'app_router.g.dart';

// Public routes (müşteriler için - login gerektirmez)
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

// Admin sign-in (gizli URL - sadece adminler bilir)
@TypedGoRoute<SignInRoute>(path: '/sign-in')
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SignInScreen();
  }
}

// Protected admin routes (authentication gerekli)
@TypedGoRoute<AdminPanelRoute>(
  path: '/admin-panel',
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<CreateCategoryRoute>(path: 'create-category'),
    //TypedGoRoute<AddProductRoute>(path: 'create-product'),
    //TypedGoRoute<AddProductRoute>(path: 'edit-category'),
    //TypedGoRoute<AddProductRoute>(path: 'edit-product'),
    //TypedGoRoute<AddProductRoute>(path: 'create-admin'),
  ],
)
class AdminPanelRoute extends GoRouteData {
  const AdminPanelRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const AdminPanelScreen();
}

class CreateCategoryRoute extends GoRouteData {
  const CreateCategoryRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const CreateCategoryScreen();
}

// class AddProductRoute extends GoRouteData {
//   const AddProductRoute();

//   @override
//   Widget build(BuildContext context, GoRouterState state) =>
//       const AddProductScreen();
// }

final GoRouter appRouter = GoRouter(
  routes: $appRoutes,
  redirect: (BuildContext context, GoRouterState state) {
    final isSignedIn = context.read<AdminRepository>().admin.value?.uid != null;
    final bool isAdminRoute = state.uri.path.startsWith('/admin-panel');

    // Admin route'a auth olmadan girilirse -> sign-in'e yönlendir
    if (isAdminRoute && !isSignedIn) {
      return '/sign-in';
    }

    return null;
  },
);
