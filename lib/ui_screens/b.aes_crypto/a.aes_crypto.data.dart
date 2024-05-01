part of '_index.dart';

class AesCryptoData {
  final rxTitle = 'Advanced Encryption Standard'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxIsCustomKey = RM.inject<bool>(() => false);

  final isEncrypt = RM.inject<bool>(() => true);

  final key = encrypt.Key.fromSecureRandom(32);
  final iv = encrypt.IV.fromSecureRandom(16);

  final rxForm = RM.injectForm(
    submit: () async {
      _ct.encryptDecrypt();
    },
    autovalidateMode: AutovalidateMode.onUserInteraction,
  );

  final rxText = RM.injectTextEditing(
    validateOnTyping: true,
    validators: [
      Validate.isNotEmpty,
    ],
  );

  final rxSecretKey = RM.injectTextEditing(
    validateOnTyping: true,
    validators: [
      Validate.isNotEmpty,
      Validate.minChars,
      Validate.maxChars,
    ],
  );

  final rxCipherText = RM.injectTextEditing();
  final rxPlainText = RM.injectTextEditing();
}
