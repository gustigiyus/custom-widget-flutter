import 'package:flutter/material.dart';
import 'package:simple_widget/core/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing Widget'),
      ),
      body: SafeArea(
        child: CustomTextField(
          controller: emailController,
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
