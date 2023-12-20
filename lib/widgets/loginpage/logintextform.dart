import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:technical_round_chargemod/cubits/Provider/LoginPage/LoginText.dart';

class Login_textForm extends StatefulWidget {
  const Login_textForm({
    super.key,
  });

  @override
  State<Login_textForm> createState() => _Login_textFormState();
}

class _Login_textFormState extends State<Login_textForm> {
  late TextEditingController _phoneNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _phoneNumber.dispose();
  }

  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: TextFormField(
        onChanged: (value) {
          setState(() {
            // context.read<LoginTextCubit>().LoginTextIs(value);
            GetStorage().write('LoginGetNumber', value);
          });
        },
        inputFormatters: [
          LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.digitsOnly,
        ],
        controller: _phoneNumber,
        keyboardType: TextInputType.number,
        cursorColor: Theme.of(context).colorScheme.onSecondary,
        decoration: InputDecoration(
          filled: true,
          label:
              _phoneNumber.text.isEmpty ? Text("Enter phone number") : Text(""),
          labelStyle: Theme.of(context).textTheme.titleMedium,
          fillColor: Color.fromRGBO(255, 255, 255, 1),
          focusColor: Color.fromRGBO(230, 116, 12, 1),
          prefixIcon: Padding(
              padding: EdgeInsets.all(13),
              child: SvgPicture.asset(
                  'assets/images/widgets/loginpage/Vector 98 (Stroke).svg')),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(228, 223, 223, 1)),
            borderRadius: BorderRadius.circular(7),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
              borderSide: BorderSide(color: Color.fromRGBO(228, 223, 223, 1))),
        ),
      ),
    );
  }
}
