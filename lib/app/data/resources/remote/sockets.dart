import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../../../domain/responses/daily_register_model.dart';
import 'AlimetsProvider.dart';

class CustomSockets {
  static late StompClient _stompClient;
  static late AlimentsProvider _alimentsProvider;

  static Future init() async {
    _stompClient = StompClient(
      config: StompConfig.SockJS(
        url:
            'https://microservice-alimentation.herokuapp.com/gs-guide-websocket',
        onConnect: (StompFrame frame) {
          print('Conectado');
          onConnect(frame);
        },
        onWebSocketError: (dynamic error) =>
            print('Error: ' + error.toString()),
      ),
    );
  }

  static void onConnect(StompFrame frame) {
    _stompClient.subscribe(
        destination: '/topic/greetings',
        callback: (StompFrame frame) {
          print('Recibido: ' + frame.body!);
          DailyRegisterModel aliment =
              DailyRegisterModel.fromMap(jsonDecode(frame.body ?? '{}'));
          print('Llega nuevo alimento **********************************');
          _alimentsProvider.aliments = aliment;
        });
  }

  static void activate(BuildContext context) {
    _alimentsProvider = Provider.of<AlimentsProvider>(context);
    _stompClient.activate();
  }

  static AlimentsProvider getAlimentsProvider() => _alimentsProvider;
}
