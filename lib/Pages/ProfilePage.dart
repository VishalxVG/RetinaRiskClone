import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewProfilePage extends StatefulWidget {
  const NewProfilePage({Key? key});

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> firstNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> lastNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> confirmPasswordKey = GlobalKey<FormState>();

  String selectedButton = 'SignIn';
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoginButtonEnabled = false;
  bool isSignUpButtonEnabled = false;

  String? validateEmail(String? value) {
    final RegExp emailRegex =
        RegExp(r"^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");

    if (value == null || value.isEmpty) {
      return "Please enter an email";
    } else if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }

    return null; // No error
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a password";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty || value != passwordController.text) {
      return "Passwords do not match";
    }
    return null;
  }

  void updateButtonStates() {
    setState(() {
      final isEmailValid = validateEmail(emailController.text) == null;
      final isPasswordValid = passwordController.text.isNotEmpty;
      final isFirstNameValid = firstNameController.text.isNotEmpty;
      final isLastNameValid = lastNameController.text.isNotEmpty;
      final isConfirmPasswordValid =
          confirmPasswordController.text == passwordController.text;

      isLoginButtonEnabled = isEmailValid && isPasswordValid;
      isSignUpButtonEnabled = isEmailValid &&
          isPasswordValid &&
          isFirstNameValid &&
          isLastNameValid &&
          isConfirmPasswordValid;
    });
  }

  @override
  void initState() {
    super.initState();
    // Set the initial state of buttons based on selectedButton value
    if (selectedButton == 'SignIn') {
      isLoginButtonEnabled = validateEmail(emailController.text) == null &&
          passwordController.text.isNotEmpty;
    } else {
      isSignUpButtonEnabled = validateEmail(emailController.text) == null &&
          passwordController.text.isEmpty &&
          lastNameController.text.isNotEmpty &&
          firstNameController.text.isNotEmpty &&
          confirmPasswordController.text == passwordController.text;
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              _singInSignUpButtons(),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: selectedButton == "SignIn"
                    ? _SignInMethod()
                    : _SignUpMethod(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Container _SignInMethod() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _emailField(),
          const SizedBox(
            height: 15,
          ),
          _passwordMethod(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: isLoginButtonEnabled ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: isLoginButtonEnabled
                          ? const Color(0xff92A3FD)
                          : Colors.grey,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _LoginWithGoogle(),
          const SizedBox(
            height: 15,
          ),
          _bottomBox()
        ],
      ),
    );
  }

  Container _SignUpMethod() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      width: double.infinity,
      child: Column(
        children: [
          _firstNameField(),
          const SizedBox(
            height: 15,
          ),
          _lastNameField(),
          const SizedBox(
            height: 15,
          ),
          _emailField(),
          const SizedBox(
            height: 15,
          ),
          _passwordMethod(),
          const SizedBox(
            height: 15,
          ),
          _confirmPasswordField(),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: SizedBox(
              width: 160,
              height: 35,
              child: ElevatedButton(
                onPressed: isSignUpButtonEnabled ? () {} : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: isSignUpButtonEnabled
                      ? const Color(0xff92A3FD)
                      : Colors.grey,
                ),
                child: const Text(
                  "SIGN UP",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _bottomBox(),
        ],
      ),
    );
  }

  Container _singInSignUpButtons() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 60,
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: 190,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedButton = 'SignIn';
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButton == "SignIn"
                  ? const Color(0xff92A3FD)
                  : Colors.blue,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.login_rounded,
                ),
                Text(
                  "SIGN IN",
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 190,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: selectedButton == "SignUp"
                  ? const Color(0xff92A3FD)
                  : Colors.blue,
            ),
            child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add_alt_sharp,
                  ),
                  Text(
                    "SIGN UP",
                  )
                ]),
            onPressed: () {
              setState(() {
                selectedButton = "SignUp";
              });
            },
          ),
        )
      ]),
    );
  }

  Form _confirmPasswordField() {
    return Form(
      key: confirmPasswordKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: confirmPasswordController,
        onChanged: (value) {
          updateButtonStates();
        },
        validator: (value) => validateConfirmPassword(value),
        decoration: InputDecoration(
          labelText: "Confirm Password",
          suffixIcon: IconButton(
            icon: Icon(isConfirmPasswordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            onPressed: () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            },
          ),
        ),
        obscureText: !isConfirmPasswordVisible,
      ),
    );
  }

  Form _lastNameField() {
    return Form(
      key: lastNameKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: lastNameController,
        onChanged: (value) {
          updateButtonStates();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a valid last name";
          }
        },
        decoration: const InputDecoration(
          labelText: "Last Name",
        ),
      ),
    );
  }

  Form _firstNameField() {
    return Form(
      key: firstNameKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: firstNameController,
        onChanged: (value) {
          updateButtonStates();
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please Enter a Valid First Name";
          }
        },
        decoration: const InputDecoration(
          labelText: "First Name",
        ),
      ),
    );
  }

  SizedBox _signInMethod() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          _emailField(),
          const SizedBox(
            height: 15,
          ),
          _passwordMethod(),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 15, color: Colors.black87),
                  ),
                ),
                SizedBox(
                  width: 160,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: isLoginButtonEnabled ? () {} : null,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: isLoginButtonEnabled
                          ? const Color(0xff92A3FD)
                          : Colors.grey,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          _LoginWithGoogle(),
          const SizedBox(
            height: 15,
          ),
          _bottomBox()
        ],
      ),
    );
  }

  Form _passwordMethod() {
    return Form(
      key: passwordKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: passwordController,
        onChanged: (value) {
          updateButtonStates();
        },
        validator: (value) => validatePassword(value),
        decoration: InputDecoration(
          labelText: "Password",
          suffixIcon: IconButton(
            icon: Icon(isPasswordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
        ),
        obscureText: !isPasswordVisible,
      ),
    );
  }

  Form _emailField() {
    return Form(
      key: emailKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TextFormField(
        controller: emailController,
        onChanged: (value) {
          updateButtonStates();
        },
        validator: (value) => validateEmail(value),
        decoration: const InputDecoration(
          labelText: "Email",
        ),
      ),
    );
  }

  SizedBox _bottomBox() {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              "Terms Of Service",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  color: Colors.black87),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Privacy Policy",
              style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 15,
                  color: Colors.black87),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Languages",
                  style: TextStyle(color: Colors.black87, fontSize: 15),
                ),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SizedBox _LoginWithGoogle() {
    return SizedBox(
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style:
            ElevatedButton.styleFrom(backgroundColor: const Color(0xff92A3FD)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/images/googleLogo.svg"),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "LOGIN WITH GOOGLE",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appbar() {
    return AppBar(
      title: const Text("Login"),
      backgroundColor: const Color(0xff92A3FD),
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.person,
            color: Colors.amber,
            size: 32,
          ),
          onPressed: () {
            // Implement your settings functionality here
          },
        ),
      ],
    );
  }
}
