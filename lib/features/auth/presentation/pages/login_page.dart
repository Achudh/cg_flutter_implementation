// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:cg_flutter_implementation/core/utils/input_validator.dart';
import 'package:cg_flutter_implementation/features/auth/presentation/providers/auth_provider.dart';
import 'package:cg_flutter_implementation/features/home/presentation/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(loginStateProvider);
    final useCase = ref.read(loginUseCaseProvider);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0XFFF7FAFF),
              Color(0xFFCAEEFE),
              Color(0XFFF7FAFF),
            ],
          ),
        ),
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Center(
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                        child: Container(
                          height: 200,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(
                              0.3,
                            ),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: FlutterLogo(
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to Flutter',
                        style: TextStyle(
                          color: Colors.grey.shade800,
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Please enter your details to continue',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    key: const Key('Username'),
                    decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'User Name',
                    ),
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      ref.read(loginStateProvider.notifier).update(
                            (state) => state.copyWith(
                              username: value,
                            ),
                          );
                    },
                    validator: (value) =>
                        InputValidator.simpleValidation(value, 'User Name'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    key: const Key('Password'),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      labelText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          state.obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          ref.read(loginStateProvider.notifier).update(
                                (state) => state.copyWith(
                                  obscurePassword: !state.obscurePassword,
                                ),
                              );
                        },
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    obscureText: state.obscurePassword,
                    onChanged: (value) {
                      ref.read(loginStateProvider.notifier).update(
                            (state) => state.copyWith(
                              password: value,
                            ),
                          );
                    },
                    validator: (value) =>
                        InputValidator.validatePassword(value),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        key: const Key('ForgotPassword'),
                        onPressed: () {},
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color(0xFF42A1D4),
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if (state.isLoading)
                    const CircularProgressIndicator()
                  else
                    MaterialButton(
                      key: const Key('Login'),
                      color: const Color(0xFF77D6FC),
                      minWidth: double.maxFinite,
                      height: 50,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ref.read(loginStateProvider.notifier).update(
                              (state) =>
                                  state.copyWith(isLoading: true, error: null));
                          try {
                            final user = await useCase.login(
                                state.username, state.password);
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) => const Home(),
                              ),
                            );
                            if (kDebugMode) {
                              print('Login successful: $user');
                            }
                          } on Exception catch (e) {
                            ref.read(loginStateProvider.notifier).update(
                                (state) => state.copyWith(
                                    isLoading: false, error: e.toString()));
                          }
                        }
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  if (state.error != null)
                    Text(
                      state.error!,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
