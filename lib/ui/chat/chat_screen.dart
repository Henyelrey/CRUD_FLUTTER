import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatWebSocketScreen extends StatefulWidget {
  const ChatWebSocketScreen({super.key});


  @override
  State<ChatWebSocketScreen> createState() => _ChatWebSocketScreenState();
}

class _ChatWebSocketScreenState extends State<ChatWebSocketScreen> {
  final _controller = TextEditingController();
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://localhost:8080/chat'), // Cambia por tu endpoint real
  );

  final List<String> _messages = [];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final mensajeJson = jsonEncode({
        "remitente": "Henyelrey",
        "contenido": _controller.text.trim(),
      });

      _channel.sink.add(mensajeJson);

      setState(() {
        _messages.insert(0, "Tú: ${_controller.text}");
      });

      _controller.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _channel.stream.listen((message) {
      try {
        final decoded = jsonDecode(message);
        final contenido = decoded["contenido"];
        setState(() {
          _messages.insert(0, "Bot: $contenido");
        });
      } catch (e) {
        // En caso de que el mensaje no sea un JSON válido
        setState(() {
          _messages.insert(0, "Bot: $message");
        });
      }
    });
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat con WebSocket')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (_, index) => ListTile(title: Text(_messages[index])),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'Escribe...'),
                  ),
                ),
                IconButton(icon: const Icon(Icons.send), onPressed: _sendMessage),
              ],
            ),
          )
        ],
      ),
    );
  }
}
