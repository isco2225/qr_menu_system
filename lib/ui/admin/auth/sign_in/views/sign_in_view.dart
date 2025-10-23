import 'package:flutter/material.dart';
import 'package:shared/widgets/base/base_scaffold.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(body: Text('Sign In View'));
  }
}
