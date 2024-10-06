import 'package:flutter/material.dart';



class AppTextField extends StatelessWidget {
  const AppTextField({super.key,this.controller});
final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {

    return  TextFormField(
      controller: controller,
    );
  }
}
