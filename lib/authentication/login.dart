import 'package:pmassignment/authentication/signup.dart';
import 'package:pmassignment/ui/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:pmassignment/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _passwordController = TextEditingController();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
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
          title: Text('Sign In', style: TextStyle(color: Colors.black)),
          elevation: 0,
        ),
        body: Container(
          margin: EdgeInsets.all(0.0),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(15.0),
              child: Form(
                key: _formKey,
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
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(
          child: Image.asset(
            'assets/images/pmlogo.png',
            scale: 1.2,
          ),
        ),
        Center(
          child: Text(
            "Expand your knowledge with us",
            style: TextStyle(
              color: Colors.black38,
              fontWeight: FontWeight.w300,
              fontSize: 18,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 50, 0, 0),
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
            padding: EdgeInsets.fromLTRB(16, 8, 16, 50),
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
                prefixIcon: Icon(Icons.lock, color: kPrimaryColor),
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
                hintText: "Enter your password",
              ),
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value.isEmpty) return 'Please enter the password';
                return null;
              },
              obscureText: !_passwordVisible,
            )),
        Center(
          child: new MaterialButton(
              onPressed: () async {
                if (_formKey.currentState.validate()) {
                  _signInWithEmailAndPassword();
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
                  child: Text("Sign In",
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
              'Don\'t have an account?',
              style: TextStyle(fontSize: 22),
            ),
            RaisedButton(
              elevation: 0,
              color: Colors.transparent,
              child: Center(
                child: Text(
                  'Sign Up',
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
                  return new SignUp();
                }));
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return HomeScreen(
          user: user,
        );
      }));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }

  // ignore: unused_element
  void _signOut() async {
    await _auth.signOut();
  }
}
