import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final stompClient = StompClient(
  config: StompConfig.SockJS(
    url: 'https://microservice-alimentation.herokuapp.com/gs-guide-websocket',
    onConnect: onConnect,
    beforeConnect: () async {
      print('beforeConnect');
    },
    onWebSocketError: (dynamic error) => print('Error: ' + error.toString()),
  ),
);

void onConnect(StompFrame frame) {
  stompClient.subscribe(
      destination: '/topic/greetings',
      callback: (StompFrame frame) {
        print(frame.body);
      });
}
