part of '_index.dart';

class AesCryptoCtrl {
  init() => logxx.i(AesCryptoCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  void encryptDecrypt() {
    try {
      var encrypter = encrypt.Encrypter(encrypt.AES(_dt.key));
      if (_dt.rxIsCustomKey.st) {
        final keyCustom = encrypt.Key.fromUtf8(_dt.rxSecretKey.value);
        encrypter = encrypt.Encrypter(encrypt.AES(keyCustom));
      }
      final encryptedText = encrypter.encrypt(_dt.rxText.value, iv: _dt.iv);
      if (_dt.isEncrypt.st) {
        _dt.rxCipherText.controller.text = encryptedText.base64;
      } else {
        final decryptedText = encrypter.decrypt64(encryptedText.base64, iv: _dt.iv);
        _dt.rxPlainText.controller.text = decryptedText;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
