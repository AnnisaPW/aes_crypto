part of '../_index.dart';

class AesCryptoButton extends StatelessWidget {
  final String title;
  final bool isEncrypt;
  const AesCryptoButton({
    super.key,
    required this.title,
    required this.isEncrypt,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => OnFormSubmissionBuilder(
        listenTo: _dt.rxForm,
        onSubmitting: () => const CircularProgressIndicator(),
        child: OutlinedButton(
          onPressed: () {
            _dt.isEncrypt.setState((s) => isEncrypt);
            _ct.encryptDecrypt();
          },
          child: Text(title),
        ),
      ),
    );
  }
}
