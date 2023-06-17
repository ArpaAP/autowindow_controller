// socket_api.dart
import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as sio;

class StreamSocketController<T> {
  StreamSocketController() {
    print('Init Stream controller ${T.toString()}');
  }

  final _socketResponse = StreamController<T>();

  void Function(T) get addResponse => _socketResponse.sink.add;

  Stream<T> get getResponse => _socketResponse.stream;

  void dispose() {
    _socketResponse.close();
  }
}

class SocketApi {
  // Factry constructor to retutn same static instance everytime you create any object.
  factory SocketApi() {
    return _socketApi;
  }

  // An internal private constructor to access it for only once for static instance of class.
  SocketApi._internal();

  static void init() {
    print('socket init connected: ${socket.connected}');
    if (socket.connected == false) {
      socket.connect();
      socket.onConnect((dynamic data) {
        print(
          'socket instance created and connected',
        );
        socket.emit(
          'message',
          'connected',
        );
      });
      socket.on('message', (data) => print(data));
      socket.onError(
        (dynamic error) => {print(error), print('socket error')},
      );
      socket.onDisconnect((dynamic data) {
        print('socket instance disconnected');
      });
    } else {
      print('socket instance already connected');
    }
  }

  // A static private instance to access _socketApi from inside class only
  static final SocketApi _socketApi = SocketApi._internal();

  static sio.Socket socket = sio.io(
    'http://hydro.inft.kr:8080',
    sio.OptionBuilder()
        .setTransports(['websocket'])
        .disableAutoConnect()
        .enableForceNewConnection()
        .setTimeout(5000)
        .setReconnectionDelay(10000)
        .enableReconnection()
        .build(),
  );
}
