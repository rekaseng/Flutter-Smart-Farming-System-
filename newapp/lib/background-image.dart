import 'package:flutter/material.dart';

class BackgroundRegister extends StatelessWidget {
  const BackgroundRegister ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Register.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BackgroundLogin extends StatelessWidget {
  const BackgroundLogin ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_layout.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BackgroundHome extends StatelessWidget {
  const BackgroundHome ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
} 

class BackgroundForgotPassword extends StatelessWidget {
  const BackgroundForgotPassword ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/forgotpassword.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BackgroundResetPassword extends StatelessWidget {
  const BackgroundResetPassword ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/resetpasswordpage.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BackgroundHelp extends StatelessWidget {
  const BackgroundHelp ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/contact_us.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}