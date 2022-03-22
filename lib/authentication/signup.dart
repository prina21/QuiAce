import 'package:email_validator/email_validator.dart';
import 'package:pmassignment/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pmassignment/ui/constants.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import '../main.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _validate = false;
  bool _passwordVisible = false;
  bool _cpasswordVisible = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _displayName = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();

  // ignore: unused_field
  bool _isSuccess;
  // ignore: unused_field
  String _userEmail;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              }),
          title:
              Text('Create an account', style: TextStyle(color: Colors.black)),
          elevation: 0,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
                autovalidate: _validate,
                child: formUI(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget formUI(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/images/pmlogo.png',
            scale: 1.2,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "First Name",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: TextFormField(
              controller: _displayName,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                prefixIcon: Icon(
                  Icons.person,
                  color: kPrimaryColor,
                ),
                hintText: "Enter your First Name",
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Please enter your First Name';
                }
                return null;
              },
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: kPrimaryColor,
                ),
                hintText: "Enter your email",
              ),
              keyboardType: TextInputType.emailAddress,
              validator: (email) => EmailValidator.validate(email)
                  ? null
                  : "Enter valid email address",
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 20),
            child: TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    }),
                hintText: "Set your password",
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                Pattern pattern =
                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value)) {
                  return "Enter valid password";
                } else {
                  return null;
                }
              },
              obscureText: !_passwordVisible,
            )),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: Text(
            "Confirm Password",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(16, 8, 16, 50),
            child: TextFormField(
              controller: _cpasswordController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: kPrimaryColor,
                ),
                suffixIcon: IconButton(
                    icon: Icon(
                      _cpasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      setState(() {
                        _cpasswordVisible = !_cpasswordVisible;
                      });
                    }),
                hintText: "Enter your password again",
              ),
              keyboardType: TextInputType.text,
              validator: (String value) {
                if (value != _passwordController.text) {
                  return "Password should be same as above";
                } else {
                  return null;
                }
              },
              obscureText: !_cpasswordVisible,
            )),
        Center(
          child: new MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _registerAccount();
                }
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 8,
                          offset: Offset(0, 10),
                          spreadRadius: -10)
                    ]),
                child: Container(
                    child: Center(
                  child: Text("Sign Up",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        letterSpacing: 1,
                      )),
                )),
              )),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: TextStyle(fontSize: 22),
            ),
            RaisedButton(
              elevation: 0,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 22,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              onPressed: () {
                //Use`Navigator` widget to push the second screen to out stack of screens
                Navigator.of(context).push(
                    MaterialPageRoute<Null>(builder: (BuildContext context) {
                  return new Login();
                }));
              },
            ),
          ],
        ),
      ],
    );
  }

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _displayName.text);
      final user1 = _auth.currentUser;
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeScreen(
                user: user1,
              )));
    } else {
      _isSuccess = false;
    }
  }
}
