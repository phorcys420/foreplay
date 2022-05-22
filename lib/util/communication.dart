// ignore_for_file: avoid_print
import "dart:convert";

import "package:web_socket_channel/web_socket_channel.dart";

Future<bool> sendDataToInstance(Uri wsUrl, Object data) async {
  late WebSocketChannel ws;

  try {
    ws = WebSocketChannel.connect(wsUrl);
  } catch (e) {
    print("Could not connect to $wsUrl: $e");
    ws.sink.close(1);
    return false;
  }

  ws.sink.add(jsonEncode(data));
  ws.sink.close();

  return true;
}

Future<int> broadcastData(Object data) async {
  int availableInstances = 0;
  List<Future<bool>> futures = [];

  for (int i = 6463; i < 6473 + 1; i++) {
    final wsUrl = "ws://127.0.0.1:$i/cumcord";
    futures.add(sendDataToInstance(Uri.parse(wsUrl), data));
  }

  List<bool> results = await Future.wait<bool>(futures);
  for (var element in results) {
    availableInstances += element ? 1 : 0;
  }

  return availableInstances;
}
