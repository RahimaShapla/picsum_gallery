// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
//import 'package:test/test.dart';

void main() async {
  late Dio dio;
  late DioAdapter dioAdapter;

  Response<dynamic> response;

  group('Accounts', () {
    const baseUrl = 'https://picsum.photos/v2/';

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: baseUrl));
      dioAdapter = DioAdapter(dio: dio);
    });

    test('test photo', () async {
      const route = 'list';

      dioAdapter.onGet(
        route,
        (server) => server.reply(201, null),
        //data: userCredentials,
      );

      // Returns a response with 201 Created success status response code.
      response = await dio.get(route);

      expect(response.statusCode, 201);
    });
  });
}
