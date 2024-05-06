import 'package:ecommerce_app/src/common/widgets/button/custom_button.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/controllers/controller_auth.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:logger/logger.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ControllerAuth _auth = ControllerAuth();
  var log = Logger();

  bool _isChecked = false;
  bool _isLoading = false;

  void _onChangeCheckBox(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  void _onTapSignUp() {
    setState(() {
      _isLoading = true;
    });
    _auth
        .signUpUseEmail(
      _emailController.text.toString(),
      _passwordController.text.toString(),
      _firstNameController.text.toString(),
      _lastNameController.text.toString(),
    )
        .then((value) {
      if (value) {
        log.i(value);
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(context, '/signinscreen');
      } else {
        setState(() {
          _isLoading = false;
        });
        Navigator.pushNamed(context, '/signupscreen');
      }
    }).catchError((error) {
      log.e('Sign Up Screen: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
      ),
      body: _isLoading
          ? Container(
              color:
                  Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
              child: Center(
                child: LoadingAnimationWidget.inkDrop(
                  color: Theme.of(context).colorScheme.onBackground,
                  size: 80,
                ),
              ),
            )
          : Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/icons/homescreen/logo-homescreen.png",
                    width: 200,
                  ),
                  Row(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(left: 10, bottom: 9, top: 2),
                        width: 180,
                        child: TextFieldCustom(
                          controller: _firstNameController,
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
                          controller: _lastNameController,
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
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
                    margin:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                    width: MediaQuery.of(context).size.width,
                    child: CustomButton(
                      onTap: _onTapSignUp,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      foregroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      borderRadiusGeometry: BorderRadius.circular(20),
                      fontSize: 25,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 21,
                      ),
                      text: "Sign up",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).colorScheme.onBackground,
                              thickness: 2,
                              indent: 10,
                              endIndent: 20,
                            ),
                          ),
                          Text(
                            "OR",
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 20,
                                    ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Theme.of(context).colorScheme.onBackground,
                              thickness: 2,
                              indent: 20,
                              endIndent: 10,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesome.google_brand,
                              ),
                            ),
                            IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesome.facebook_brand,
                              ),
                            ),
                            IconButton.outlined(
                              onPressed: () {},
                              icon: const Icon(
                                FontAwesome.apple_brand,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
      ],
    );
  }
}
