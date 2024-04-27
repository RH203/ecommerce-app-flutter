import 'package:ecommerce_app/src/common/widgets/button/custom_button.dart';
import 'package:ecommerce_app/src/common/widgets/fields/text_field_custom.dart';
import 'package:ecommerce_app/src/features/auth_screen/models/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:icons_plus/icons_plus.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.popAndPushNamed(context, '/homescreen'),
          icon: const Icon(
            FontAwesome.arrow_left_solid,
          ),
        ),
      ),
      body: AnimatedContainer(
        curve: Curves.bounceIn,
        duration: const Duration(milliseconds: 750),
        margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 5),
              child: Text(
                "Sign in",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: 200,
              child: Image.asset(
                "assets/icons/homescreen/logo-homescreen.png",
              ),
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
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 2),
              width: MediaQuery.of(context).size.width,
              child: CustomButton(
                onTap: () => Navigator.pushNamed(context, '/mainscreen'),
                backgroundColor: Theme.of(context).colorScheme.secondary,
                foregroundColor: Theme.of(context).colorScheme.onSecondary,
                borderRadiusGeometry: BorderRadius.circular(20),
                fontSize: 25,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 21,
                ),
                text: "Sign in",
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
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
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
              "Remember me",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget password?",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  decoration: TextDecoration.underline,
                  fontSize: 14,
                ),
          ),
        )
      ],
    );
  }
}
