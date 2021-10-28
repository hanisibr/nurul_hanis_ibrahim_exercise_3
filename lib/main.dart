import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State1 createState() => State1();
}

class State1 extends State<MyApp> {
  late TextEditingController nameController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  String? dropdownValue;
  bool isButtonActive = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController = TextEditingController();
    nameController.addListener(() {
      final isButtonActive = nameController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });

    passwordController = TextEditingController();
    passwordController.addListener(() {
      final isButtonActive = passwordController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });

    emailController = TextEditingController();
    emailController.addListener(() {
      final isButtonActive = emailController.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nameController.dispose();
    passwordController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('The Cool Kid App - Home'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
          padding: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Welcome, Cool Kid',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )),
              Container(
                  child: Column(
                children: <Widget>[
                  Image.asset('assets/images/spec2.png'),
                ],
              )),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  hint: Text('Select your gender'),
                  icon: const Icon(Icons.arrow_drop_down),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>[
                    'Male',
                    'Female',
                    'Others',
                    'Prefer not to say'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                height: 55,
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                    child: Text('Sign Up'),
                    onPressed: isButtonActive
                        ? () {
                            setState(() => isButtonActive = false);
                            nameController.clear();
                            passwordController.clear();
                            emailController.clear();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text(
                                    'You have successfully signed up!',
                                    textAlign: TextAlign.center)));
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple,
                        textStyle: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold))),
              ),
            ],
          )),
    );
  }
}
