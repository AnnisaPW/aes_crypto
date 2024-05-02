part of '../_index.dart';

class AesCryptoText extends StatelessWidget {
  const AesCryptoText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxText.controller,
        focusNode: _dt.rxText.focusNode,
        onEditingComplete: () => _dt.rxSecretKey.focusNode.requestFocus(),
        decoration: InputDecoration(
          isDense: true,
          errorText: _dt.rxText.error,
          labelText: 'Text',
          hintText: 'Enter the text for encryption',
          alignLabelWithHint: true,
          suffixIcon: OnReactive(
            () => _dt.rxText.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Clear',
                    onPressed: () {
                      _dt.rxText.reset();
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
