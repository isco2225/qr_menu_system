import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../app/app.dart';
import '../../../../../data/data.dart';
import '../../auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final SignInViewModel signInViewModel;
  @override
  void initState() {
    super.initState();
    signInViewModel = SignInViewModel(
      adminRepository: context.read<AdminRepository>(),
    );
    signInViewModel.signIn.handleError(context);
    signInViewModel.signIn.handleCompleted(
      context,
      onCompleted: (result) {
        AdminPanelRoute().go(context);
      },
    );
  }

  @override
  void dispose() {
    signInViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SignInView(signInViewModel: signInViewModel);
  }
}
