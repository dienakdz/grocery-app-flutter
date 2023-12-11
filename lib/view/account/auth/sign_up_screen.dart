import 'package:flutter/material.dart';
import 'package:my_grocery/controller/controllers.dart';
import 'package:my_grocery/extention/string_extention.dart';

import '../../../component/input_outline_button.dart';
import '../../../component/input_text_button.dart';
import '../../../component/input_text_field.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Text("Tạo tài khoản,",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold)),
                const Text(
                  "Đăng ký để bắt đầu!",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2),
                ),
                const Spacer(
                  flex: 3,
                ),
                InputTextField(
                  title: 'Tên',
                  textEditingController: fullNameController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Trường này không được để trống";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Email',
                  textEditingController: emailController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Trường này không được để trống";
                    } else if (!value.isValidEmail) {
                      return "Vui lòng nhập email hợp lệ";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Mật khẩu',
                  obsecureText: true,
                  textEditingController: passwordController,
                  validation: (String? value) {
                    List<String> _validation = [];
                    if (value == null || value.isEmpty) {
                      return "Trường này không được để trống";
                    } else {
                      if (!value.isValidPasswordHasNumber) {
                        _validation.add("Phải chứa 1 số");
                      }
                      if (!value.isValidPasswordHasCapitalLetter) {
                        _validation.add("Phải có 1 chữ in hoa");
                      }
                      if (!value.isValidPasswordHasLowerCaseLetter) {
                        _validation.add("Phải chứa 1 chữ cái đơn giản");
                      }
                      if (!value.isValidPasswordHasSpecialCharacter) {
                        _validation.add(
                            "Phải chứa 1 ký tự đặc biệt[! @ # \$ %]");
                      }
                    }
                    String msg = '';
                    if (_validation.isNotEmpty) {
                      for (var i = 0; i < _validation.length; i++) {
                        msg = msg + _validation[i];
                        if ((i + 1) != _validation.length) {
                          msg = msg + "\n";
                        }
                      }
                    }
                    return msg.isNotEmpty ? msg : null;
                  },
                ),
                const SizedBox(height: 10),
                InputTextField(
                  title: 'Xác nhận mật khẩu',
                  obsecureText: true,
                  textEditingController: confirmController,
                  validation: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Trường này không được để trống";
                    } else if (passwordController.text != value) {
                      return "Xác nhận mật khẩu không khớp";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                const Spacer(),
                InputTextButton(
                  title: "Đăng kí",
                  onClick: () {
                    if (_formKey.currentState!.validate()) {
                      authController.signUp(fullName: fullNameController.text,
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }
                  },
                ),
                const SizedBox(height: 10),
                InputOutlineButton(
                  title: "Quay lại",
                  onClick: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer(
                  flex: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Tôi đã là thành viên rồi, "),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}