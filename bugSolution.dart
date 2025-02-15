```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      // Process the data
    } else {
      // Handle different HTTP error codes
      throw HttpException('HTTP error: ${response.statusCode}', uri: Uri.parse('https://api.example.com/data'));
    }
  } on SocketException {
    // Handle socket exceptions (network issues)
    print('Network error: Please check your internet connection.');
  } on TimeoutException {
    // Handle timeout exceptions
    print('Request timed out. Please try again later.');
  } on FormatException catch (e) {
    // Handle JSON decoding errors
    print('JSON decoding error: $e');
  } on HttpException catch (e) {
    // Handle HTTP exceptions
    print('HTTP error: ${e.message} at ${e.uri}');
  } catch (e) {
    // Handle any other exceptions
    print('An unexpected error occurred: $e');
  }
}
```