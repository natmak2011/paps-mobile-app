import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> createRequest(String firstName, middleName, lastName, phoneNumber, email, passportNumber) async {

  final response = await http.post(
    Uri.parse('http://192.168.8.168:8080/api/request'),
        headers: <String, String>{
      'Content-Type': 'application/json',
             },
    body: jsonEncode(<String, String>{
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'date_of_birth': '1990-01-01',
      'phone_number': phoneNumber,
      'email_address': email,
      'passport_number': passportNumber,

    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response, then parse the JSON.
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    // If the server did not return a 201 CREATED response, then throw an exception.
    throw Exception('Failed to create an account.');
  }
}