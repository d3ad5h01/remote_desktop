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
    await Socket.connect('192.168.0.6',6969).then((socket){
           socket.write('Connected ... ');
           print('Sonn');
        });
}
void main(){
  connect();
}
