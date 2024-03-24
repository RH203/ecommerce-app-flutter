import 'package:ecommerce_app/src/common/widgets/button/custom_button.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isChecked = false;

  void _onChangeCheckBox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/homescreen'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 9),
                  width: 180,
                  child: TextFieldCustom(
                    controller: _emailController,
                    hintText: "First Name",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }

                      if (!Validator.emailIsValid(value)) {
                        return "Invalid Email";
                      }

                      return "null";
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10, bottom: 9),
                  width: 180,
                  child: TextFieldCustom(
                    controller: _emailController,
                    hintText: "Last Name",
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }

                      if (!Validator.emailIsValid(value)) {
                        return "Invalid Email";
                      }

                      return "null";
                    },
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: MediaQuery.of(context).size.width,
              child: TextFieldCustom(
                controller: _emailController,
                hintText: "Email",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }

                  if (!Validator.emailIsValid(value)) {
                    return "Invalid Email";
                  }

                  return "null";
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
              width: MediaQuery.of(context).size.width,
              child: TextFieldCustom.password(
                controller: _passwordController,
                hintText: "Password",
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (!Validator.passwordIsValid(value)) {
                    return "Invalid Password";
                  }

                  return "null";
                },
              ),
            ),
            _rememberMe(context),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              width: 350,
              child: CustomButton(
                onTap: () {},
                text: Text(
                  "Sign up",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 20,
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row _rememberMe(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Checkbox(
            value: _isChecked,
            checkColor: Theme.of(context).colorScheme.onSurface,
            fillColor: MaterialStateProperty.all<Color>(
              Theme.of(context).colorScheme.surface,
            ),
            onChanged: _onChangeCheckBox,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: _isChecked ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            splashRadius: 16,
          ),
        ),
        Text(
          "I agree to the terms and conditions",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}
