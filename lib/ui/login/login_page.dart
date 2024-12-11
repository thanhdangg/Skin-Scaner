import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skin_scanner/configs/app_color.dart';
import 'package:skin_scanner/configs/app_route.gr.dart';
import 'package:skin_scanner/ui/login/bloc/login_bloc.dart';
import 'package:skin_scanner/utils/enum.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: const Text(
          'SKIN SCANNER',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Welcome Back!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      prefixIcon:
                          Icon(Icons.person, color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPasswordVisible,
                    builder: (context, isPasswordVisible, child) {
                      return TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          prefixIcon:
                              Icon(Icons.lock, color: AppColor.primaryColor),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: AppColor.primaryColor,
                            ),
                            onPressed: () {
                              _isPasswordVisible.value = !isPasswordVisible;
                            },
                          ),
                        ),
                        obscureText: !isPasswordVisible,
                      );
                    },
                  ),
                  const SizedBox(height: 24.0),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      // Navigate to the Home page
                      context.router.replace(const HomeRoute());

                      if (state.status == BlocStateStatus.success) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: const Text('Login Successful'),
                              backgroundColor: AppColor.primaryColor),
                        );
                        saveLoginStatus();
                        context.router.replace(const HomeRoute());
                      } else if (state.status == BlocStateStatus.failure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Login Failed')),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state.status == BlocStateStatus.loading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        onPressed: () {
                          context.read<LoginBloc>().add(
                                LoginSubmitted(
                                  _usernameController.text,
                                  _passwordController.text,
                                ),
                              );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16.0),
                  OutlinedButton(
                    onPressed: () {
                      // Handle "Forgot Password" action
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      side: BorderSide(color: AppColor.primaryColor),
                    ),
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          fontSize: 16.0, color: AppColor.primaryColor),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {
                          context.router.push(RegisterRoute());
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    await prefs.setString('username', _usernameController.text);
  }
}
