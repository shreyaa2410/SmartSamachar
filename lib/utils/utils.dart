import 'package:flutter/material.dart';

TextStyle textStyle1() {
  return TextStyle(
      fontSize: 16, backgroundColor: Color.fromARGB(255, 109, 215, 215));
}

TextStyle textStyle2() {
  return TextStyle(
    fontSize: 16,
    color: Color.fromARGB(255, 41, 39, 39),
  );
}

TextField reusableText(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    obscureText: isPasswordType,
    cursorColor: Colors.white,
    decoration: InputDecoration(
      icon: Icon(icon),
      labelText: text,
    ),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

// showAlertDialog(BuildContext context) {
//   // Create button
//   Widget okButton = ElevatedButton(
//     child: Text("OK"),
//     onPressed: () {
//       Navigator.of(context).pop();
//     },
//   );

//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text("Invalid Password"),
//     content: Text("Enter a valid Password"),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }
void showErrorDialog(BuildContext context, String errorMessage) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Error'),
        content: Text(errorMessage),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}
