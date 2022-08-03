import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../../../domain/responses/daily_register_model.dart';
import '../../../ui/pages/home/home_page.dart';

class CustomSockets {
  static late StompClient _stompClient;

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
          DailyRegisterModel aliment =
              DailyRegisterModel.fromMap(jsonDecode(frame.body ?? '{}'));
          print('Llega nuevo alimento **********************************');
          homeProvider.read.aliments = aliment;
        });
  }

  static void activate(BuildContext context) {
    print('Activando');
    _stompClient.activate();
  }
}
