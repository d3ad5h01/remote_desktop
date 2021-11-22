import 'dart:io';
import 'dart:convert' show utf8;

//class serSoc {
  void serr() {
    ServerSocket.bind('127.0.0.1', 6969).then((serverSocket) {
      serverSocket.listen((socket) {
        socket.listen(print);
      });
    });
  }
//}

void connect() async
{
    var socket = await WebSocket.connect('http://34.127.90.130:80/');
    socket.add('Hello, World!');
}
void main(){
  connect();
}
