// import 'package:flutter/material.dart';
// import 'package:movie_app/services/auth_services.dart';
// import 'package:movie_app/utils/colors.dart';
// import 'package:movie_app/widgets/input.dart';
// import 'package:movie_app/widgets/priamry_btn.dart';
// import 'package:movie_app/widgets/secondary_button.dart';

// class SignupScreen extends StatefulWidget {
//   const SignupScreen({super.key});

//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }

// class _SignupScreenState extends State<SignupScreen> {
//   final TextEditingController _fullNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: const EdgeInsets.all(20.0),
//         width: double.infinity,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const Text(
//               "MOVIE APP",
//               style: TextStyle(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: kPrimaryColor,
//               ),
//             ),
//             const SizedBox(
//               height: 32,
//             ),
//             const Text(
//               "SIGN UP",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: kWhiteColor,
//               ),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Input(
//               label: "Full Name",
//               controller: _fullNameController,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Input(
//               keyboardType: TextInputType.emailAddress,
//               label: "Email Address",
//               controller: _emailController,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Input(
//               isPassword: true,
//               label: "Password",
//               controller: _passwordController,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             SizedBox(
//                 width: double.infinity,
//                 child: PrimaryButton(
//                   onTap: () {},
//                   title: "Siagn Up",
//                 )),
//             const SizedBox(
//               height: 16,
//             ),
//             SizedBox(
//               width: double.infinity,
//               child: SecondaryButton(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 title: "Back to Login",
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
