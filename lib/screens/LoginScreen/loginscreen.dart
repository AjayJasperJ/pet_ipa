import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pet_adoption_carmel/Helpers/Colors/colors.dart';
import 'package:pet_adoption_carmel/screens/BottomNavigationScreen/bottomnavigationscreen.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/models/profilemodel.dart';
import 'package:pet_adoption_carmel/screens/ProfileScreen/provider/userprovider.dart';
import 'package:pet_adoption_carmel/screens/RegisterScreen/registerscreen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool rememberMe = true;
  bool loading = false;
  late bool _passwordVisible;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void loginAdopter(String email, String password) async {
    print(email);
    print(password);
    const url =
        'http://campus.sicsglobal.co.in/Project/PetAdoption/api/login.php';

    Map<String, String> body = {'email': email, 'password': password};

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
      );
      print(url);
      var jsonData = json.decode(response.body);
      print(jsonData);
      print(jsonData["status"]);
      if (response.statusCode == 200) {
        if (jsonData['status'] == true) {
          //      getstorage.write("phone",loginModel!.phone.toString());
          // getstorage.write("password",loginModel!.password.toString());
          // getstorage.read(phone);
          // phone=getstorage.read("phone");

          List user = jsonData['userDetails'];
          if (user.isNotEmpty) {
            ProfileModel userdata = ProfileModel.fromJson(user[0]);
            String userId = userdata.userid;
            Provider.of<UserProvider>(context, listen: false)
                .setCurrentUserId(userId);
            print(userId);
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: purpleColor,
              content: const Text(
                'Login Successful!',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const PetBottomNavigation()));
          print(body);
          print("Response body${response.body}");

          print('Login successful');
        } else if (jsonData['status'] == false) {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: purpleColor,
              content: const Text(
                'Invalid email and password',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              duration: const Duration(seconds: 4),
            ),
          );
          print('Error: ${response.statusCode}');
        }
      } else {
        print('fffff');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final userdata = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/logoimage.jpg'), fit: BoxFit.cover)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Center(
                    //   child: Image.asset(
                    //     'assets/login_page.webp',
                    //     height: 280,
                    //     width: 3500,
                    //   ),
                    // ),
                    const Center(
                      child: Text(
                        'LOGIN ',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    const Text(
                      'Email',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormField(
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: Colors.white,
                          ),
                          // hintText: 'Enter Phone Number/Email ID/BN User Id',
                          hintText: 'Email',
                          hintStyle: const TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: size.height * 0.03),
                    const Text(
                      'Password',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: size.height * 0.01),
                    TextFormField(
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      obscureText: _passwordVisible,
                      controller: passwordcontroller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          fillColor: Colors.white.withOpacity(0.5),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock_outline,
                              color: Colors.white),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey[400]),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontSize: 13, color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Row(
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {
                          //         rememberMe = !rememberMe;
                          //         setState(() {});
                          //       },
                          //       child: Container(
                          //         //margin: const EdgeInsets.only(left: 7),
                          //         width: size.width * 0.05,
                          //         height: size.height * 0.025,
                          //         decoration: BoxDecoration(
                          //             color: Colors.white,
                          //             borderRadius: BorderRadius.circular(2),
                          //             border: Border.all(
                          //                 color: rememberMe
                          //                     ? Colors.blue
                          //                     : Colors.black)),
                          //         child: Center(
                          //             child: rememberMe
                          //                 ? const Icon(
                          //                     Icons.done,
                          //                     size: 15,
                          //                     color: Colors.black,
                          //                   )
                          //                 : Container()),
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 15,
                          //     ),
                          //     // const Text(
                          //     //   'Remember me',
                          //     //   style: TextStyle(color: Colors.white),
                          //     // )
                          //   ],
                          // ),
                          InkWell(
                            onTap: () {},
                            child: const Text(
                              '',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: size.height * 0.02,
                    // ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loginAdopter(
                              emailcontroller.text.toString(),
                              passwordcontroller.text.toString(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.transparent),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 50.0),
                        ),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Already have an account ?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterPage()));
                            },
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
