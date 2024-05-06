part of '../_index.dart';

class AesCryptoSecretKey extends StatelessWidget {
  const AesCryptoSecretKey({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OnFormBuilder(
      listenTo: _dt.rxForm,
      builder: () => TextField(
        controller: _dt.rxSecretKey.controller,
        focusNode: _dt.rxSecretKey.focusNode,
        maxLength: 32,
        onEditingComplete: () => _dt.rxSecretKey.focusNode.unfocus(),
        decoration: InputDecoration(
          isDense: true,
          errorText: _dt.rxSecretKey.error,
          labelText: 'Secret key',
          hintText: 'Enter your 32 characters secret key',
          alignLabelWithHint: true,
          suffixIcon: OnReactive(
            () => _dt.rxSecretKey.text.isNotEmpty
                ? IconButton(
                    tooltip: 'Clear',
                    onPressed: () {
                      _dt.rxSecretKey.reset();
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
