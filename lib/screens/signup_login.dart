// import 'package:ethiopia/pages/detail_page.dart';
// import 'package:ethiopia/widget/app_large_text.dart';
// import 'package:ethiopia/widget/app_text.dart';
// import 'package:ethiopia/widget/appbutton.dart';
// import 'package:ethiopia/widget/explore_button.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
//
// import 'Auth.dart';
//
//
//
// class SignLogin extends StatefulWidget {
//   const SignLogin({Key? key}) : super(key: key);
//
//   @override
//   State<SignLogin> createState() => _SignLoginState();
// }
//
// class _SignLoginState extends State<SignLogin> {
//
//   String? _userId = UserManager.userId;
//
//   @override
//   void initState() {
//     super.initState();
//     UserManager.getCurrentUser();
//   }
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.maxFinite,
//         height: double.maxFinite,
//         child: Stack(
//           children: [
//             Positioned(
//                 left: 20,
//                 top:50,
//                 child: Row(
//                   children: [
//                     IconButton(onPressed: (){}, icon: Icon(Icons.menu),
//                         color:Colors.white)
//                   ],
//                 )),
//             Positioned(
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   width: double.maxFinite,
//                   height: 300,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: AssetImage("images/categories/Hist&cal/lalibela.jpg"),
//                         fit:BoxFit.cover
//                     ),
//
//                   ),
//                 )
//             ),
//             Positioned(
//               top:280,
//               child: Container(
//                 padding: const EdgeInsets.only(left:20,right:20,top:30),
//                 width: MediaQuery.of(context).size.width,
//                 height: 500,
//
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//
//                     )
//                 ),
//         ),
//       ),
//
//           Positioned(
//             top:280,
//             child: Container(
//
//               padding: const EdgeInsets.only(left:20,right:20,top:30),
//               width: MediaQuery.of(context).size.width,
//               height: 500,
//         child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: <Widget>[
//                 TextField(
//                   controller: firstNameController,
//                   decoration: InputDecoration(
//                     labelText: 'First Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 TextField(
//                   controller: lastNameController,
//                   decoration: InputDecoration(
//                     labelText: 'Last Name',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10.0),
//                 TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                     ),
//                   ),
//                 ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: () {
//                 FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
//                   print("created new account");
//                   print(_userId);
//
//                  //  Navigator.push(context,
//                  //   MaterialPageRoute(builder: (context)=>Login()));
//                  // }).onError((error, stackTrace) {
//                  //  print("error ${error.toString()}");
//
//                 });
//                 },
//                 child: Text('Sign Up'),
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
//                   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                     RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30.0),
//                     ),
//                   ),
//                     fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
//                 ),
//
//               ),
//
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => Login(),)
//                       );
//                     },
//                     child: Text(
//                       'Already have an account?',
//                       style: TextStyle(
//                         color: Colors.blue,
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//         ),
//               ),
//             ),
//
// ]
//         )
//     ),
//     );
//   }
// }
// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);
//
//   @override
//   State<Login> createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   String? _userId = UserManager.userId;
//
//   @override
//   void initState() {
//     super.initState();
//     UserManager.getCurrentUser();
//   }
//
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController lastNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//           width: double.maxFinite,
//           height: double.maxFinite,
//           child: Stack(
//               children: [
//                 Positioned(
//                     left: 20,
//                     top:50,
//                     child: Row(
//                       children: [
//                         IconButton(onPressed: (){}, icon: Icon(Icons.menu),
//                             color:Colors.white)
//                       ],
//                     )),
//                 Positioned(
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                       width: double.maxFinite,
//                       height: 300,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: AssetImage("images/categories/Hist&cal/lalibela.jpg"),
//                             fit:BoxFit.cover
//                         ),
//
//                       ),
//                     )
//                 ),
//                 Positioned(
//                   top:280,
//                   child: Container(
//                     padding: const EdgeInsets.only(left:20,right:20,top:30),
//                     width: MediaQuery.of(context).size.width,
//                     height: 500,
//
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//
//                         )
//                     ),
//                   ),
//                 ),
//
//                 Positioned(
//                   top:280,
//                   child: Container(
//
//                     padding: const EdgeInsets.only(left:20,right:20,top:30),
//                     width: MediaQuery.of(context).size.width,
//                     height: 500,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: <Widget>[
//                         TextField(
//                           controller: emailController,
//                           decoration: InputDecoration(
//                             labelText: 'Email',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(25.0),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 30.0),
//                         TextField(
//                           controller: passwordController,
//                           obscureText: true,
//                           decoration: InputDecoration(
//                             labelText: 'Password',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(25.0),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 50.0),
//                         ElevatedButton(
//                           onPressed: () {
//                             FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value){
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => DetailPage())
//
//                                   );
//                               Text('User ID: $_userId');
//                               }).onError((error, stackTrace) {
//                                 print("error${error.toString()}");
//                             });
//
//
//                           },
//                           child: Text('Login'),
//                           style: ButtonStyle(
//                             backgroundColor: MaterialStateProperty.all<Color>(Colors.brown),
//                             shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                               RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(30.0),
//                               ),
//                             ),
//                             fixedSize: MaterialStateProperty.all<Size>(Size(100, 50)),
//                           ),
//
//                         ),
//                         SizedBox(
//                           height: 30,
//                         ),
//                         Center(
//                           child: GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(builder: (context) => SignLogin(),)
//                               );
//                             },
//                             child: Text(
//                               'New Member?',
//                               style: TextStyle(
//                                 color: Colors.blue,
//                                 decoration: TextDecoration.underline,
//                               ),
//                             ),
//                           ),
//                         ),
//
//                       ],
//                     ),
//                   ),
//                 ),
//
//               ]
//           )
//       ),
//     );
//   }
// }
