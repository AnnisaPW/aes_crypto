import 'package:flutter/material.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryptography App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CryptoView(),
    );
  }
}

class CryptoView extends StatefulWidget {
  const CryptoView({super.key});

  @override
  State<CryptoView> createState() => _CryptoViewState();
}

class _CryptoViewState extends State<CryptoView> {
  final TextEditingController _controller = TextEditingController();
  String _encryptedText = '';
  String _decryptedText = '';
  final key = encrypt.Key.fromLength(32);
  final iv = encrypt.IV.fromLength(16);

  void _encryptText(String text) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final encrypted = encrypter.encrypt(text, iv: iv);
    setState(() {
      _encryptedText = encrypted.base64;
    });
  }

  void _decryptText(String encryptedText) {
    final encrypter = encrypt.Encrypter(encrypt.AES(key));

    final decrypted = encrypter.decrypt64(encryptedText, iv: iv);
    setState(() {
      _decryptedText = decrypted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cryptography App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter text to encrypt'),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _encryptText(_controller.text);
              },
              child: const Text('Encrypt'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Encrypted Text: $_encryptedText',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                _decryptText(_encryptedText);
              },
              child: const Text('Decrypt'),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Decrypted Text: $_decryptedText',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
