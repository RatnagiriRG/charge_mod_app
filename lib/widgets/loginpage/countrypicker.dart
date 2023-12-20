
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class login_countrypicker extends StatefulWidget {
  const login_countrypicker({super.key});

  @override
  State<login_countrypicker> createState() => _login_countrypickerState();
}

enum countrylogo { India, China, America }

class _login_countrypickerState extends State<login_countrypicker> {
  countrylogo? selectedCountry;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context).clearSnackBars();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Currently Indian phone number can only register ...!"),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromRGBO(255, 255, 255, 1)
          ]),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            width: 1,
            color: Color.fromRGBO(228, 223, 223, 1),
          ),
        ),
        child: Center(
          child: SizedBox(
              width: 70,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: null,
                  value: selectedCountry,
                  hint: SvgPicture.asset(
                      'assets/images/widgets/loginpage/countrypicker/Vector 98 (Stroke).svg'),
                  items: [],

                  // countrylogo.values
                  //     .map((country) => DropdownMenuItem(
                  //         child: Text("hai")))
                  //     .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      selectedCountry = value as countrylogo?;
                    });
                  },
                ),
              )),
        ),

        //  Center(
        //   child: CountryCodePicker(
        //     backgroundColor: Theme.of(context).colorScheme.background,
        //     initialSelection: "IN",
        //     countryFilter: [],
        //     showFlagMain: true,
        //     showFlagDialog: true,
        //     showCountryOnly: true,
        //     showDropDownButton: false,
        //   ),
        // ),
      ),
    );
  }
}
