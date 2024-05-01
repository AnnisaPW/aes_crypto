part of '../_index.dart';

class AesCryptoPlainText extends StatelessWidget {
  const AesCryptoPlainText({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dt.rxPlainText.controller,
      focusNode: _dt.rxPlainText.focusNode,
      readOnly: true,
      decoration: InputDecoration(
        isDense: true,
        errorText: _dt.rxPlainText.error,
        labelText: 'Plain Text',
        suffixIcon: OnReactive(
          () => _dt.rxPlainText.text.isNotEmpty
              ? IconButton(
                  tooltip: 'Copy to Clipboard',
                  onPressed: () {
                    FlutterClipboard.copy(_dt.rxPlainText.text).then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          content: const Text(
                            'Text Copied',
                            textAlign: TextAlign.center,
                          ),
                          behavior: SnackBarBehavior.floating,
                          width: 120,
                          backgroundColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.copy_rounded,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
