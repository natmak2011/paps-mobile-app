import 'package:flutter/material.dart';
import 'api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Passport Application- PAPS'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? firstName, middleName, lastName, birthDate, phoneNumber, email, passportNumber;

  void _handleCreateRequest() {

   final data = createRequest (firstName!, middleName, lastName, phoneNumber, email, passportNumber);
    ScaffoldMessenger.of(context)
    .showSnackBar(const SnackBar(content: Text("Request Created Successfully, Please check your email.")));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center
            ,
          children:  [
            const Text (
                "Create Request",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700, color: Colors.blue),
            ),
            const SizedBox(height: 2,),
            const Text("First Name"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.name,
              onChanged: (String value){firstName = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Middle Name"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.name,
              onChanged: (String value){middleName = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Last Name"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.name,
              onChanged: (String value){lastName = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Birth Date"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.name,
              onChanged: (String value){birthDate = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Phone Number"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.phone ,
              onChanged: (String value){phoneNumber = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Email"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value){email = value;},
            ),
            const SizedBox(height: 2,),
            const Text("Passport Number"),
            TextField(
              autofocus: true,
              keyboardType: TextInputType.name,
              onChanged: (String value){passportNumber = value;},
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
              ),
              onPressed: _handleCreateRequest,
              child: const Text('Create Request'),
              ),

       ] ),
      ),
    );


  }
 }