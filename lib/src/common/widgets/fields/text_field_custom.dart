import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  })  : isPassword = false,
        isSearch = false,
        searchFunction = null;

  const TextFieldCustom.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.validator,
    this.keyboardType = TextInputType.name,
  })  : isPassword = true,
        isSearch = false,
        searchFunction = null;

  const TextFieldCustom.search(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.validator,
      this.keyboardType = TextInputType.name,
      required this.searchFunction})
      : isPassword = false,
        isSearch = true;

  final TextEditingController controller;
  final bool isPassword;
  final bool isSearch;
  final String hintText;
  final TextInputType keyboardType;
  final String Function(String?)? validator;
  final void Function()? searchFunction;
  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  bool isVisible = false;

  void onToggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 18,
      ),
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: onToggleVisibility,
                child: Icon(
                  isVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              )
            : widget.isSearch
                ? IconButton(
                    onPressed: widget.searchFunction,
                    icon: Icon(
                      EvaIcons.search,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  )
                : null,
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.surface,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 2,
          ),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
        contentPadding: const EdgeInsets.all(17),
      ),
      obscureText: widget.isPassword && !isVisible,
      validator: widget.validator,
    );
  }
}
