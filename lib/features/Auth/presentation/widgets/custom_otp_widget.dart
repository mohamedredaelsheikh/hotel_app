import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_app/core/constants/constants.dart';

class CustomOtpWidget extends StatefulWidget {
  const CustomOtpWidget({super.key});

  @override
  State<CustomOtpWidget> createState() => CustomOtpWidgetState();
}

class CustomOtpWidgetState extends State<CustomOtpWidget> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      FocusScope.of(context).nextFocus();
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).previousFocus();
    }
  }

  void clearFields() {
    for (var controller in _controllers) {
      controller.clear();
    }
    setState(() {});
    FocusScope.of(context).requestFocus(_focusNodes[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(6, (index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: MediaQuery.of(context).size.width * 0.1,
          child: TextFormField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: InputDecoration(
              counterText: '',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: kPrimaryColor),
              ),
              filled: true,
              fillColor: Colors.grey[300],
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            onChanged: (value) => _onChanged(value, index),
          ),
        );
      }),
    );
  }
}
