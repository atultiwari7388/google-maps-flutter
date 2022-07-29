import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBodySection(),
    );
  }

  Widget buildBodySection() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //top section
            topSection(),
            //form field section
            const SizedBox(height: 20),
            const CustomTextFormWidget(),
            const SizedBox(height: 100),
            //button section
            const CustomButtonWidget(),
            //bottom section
            const SizedBox(height: 15),
            CustomRowWidget(
              text1: "Don't have an account? ",
              text2: "Sign up",
              onTap: () {
                if (kDebugMode) {
                  print("Next Page");
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget topSection() {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/logo.png",
              height: 50,
              width: 50,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Maintenance",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xff2d3142),
                  ),
                ),
                Text(
                  "Box",
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xfff9703b),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40),
        const Center(
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "Rubik Medium",
              color: Color(0xff2d3142),
            ),
          ),
        ),
        const SizedBox(height: 14),
        const Center(
          child: Text(
            "A delegate that supplies children\nfor slivers using a builder callback.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff4c5980),
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTextFormWidget extends StatelessWidget {
  const CustomTextFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: "Email",
              fillColor: const Color(0xfff8f9fa),
              filled: true,
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: Color(0xff323f4b),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffe4e7eb),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffe4e7eb),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: "Password",
              fillColor: const Color(0xfff8f9fa),
              filled: true,
              prefixIcon: const Icon(
                Icons.lock_open_outlined,
                color: Color(0xff323f4b),
              ),
              suffixIcon: const Icon(
                Icons.visibility,
                color: Color(0xff323f4b),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffe4e7eb),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Color(0xffe4e7eb),
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Forgot Password?",
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRowWidget extends StatelessWidget {
  const CustomRowWidget(
      {Key? key, required this.text1, required this.text2, required this.onTap})
      : super(key: key);
  final String text1, text2;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: text1,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: "Rubik Regular",
            color: Color(0xff2d3142),
          ),
          children: [
            TextSpan(
              text: text2,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Rubik Medium",
                color: Color(0xfff9703b),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 300,
      decoration: BoxDecoration(
        color: const Color(0xfff9703b),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Center(
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
