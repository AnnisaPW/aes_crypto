part of '_index.dart';

class AesCryptoView extends StatelessWidget {
  const AesCryptoView({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: AesCryptoAppbar(),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Card(
            color: Colors.grey.withOpacity(0.1),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: OnFormBuilder(
                  listenTo: _dt.rxForm,
                  builder: () {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBoxH(50),
                            const AesCryptoText(),
                            const SizedBoxH(15),
                            OnReactive(
                              () => Row(
                                children: [
                                  Checkbox(
                                    value: _dt.rxIsCustomKey.st,
                                    onChanged: (value) {
                                      _dt.rxIsCustomKey.setState((s) => value);
                                    },
                                  ),
                                  const Text('Encrypt with a custom secret key (length = 32)'),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: _dt.rxIsCustomKey.st,
                              maintainAnimation: true,
                              maintainState: true,
                              child: const AesCryptoSecretKey(),
                            ),
                            const SizedBoxH(15),
                            const AesCryptoButton(
                              title: 'Encrypt',
                              isEncrypt: true,
                            ),
                            const SizedBoxH(15),
                            const AesCryptoCipherText(),
                            const SizedBoxH(15),
                            const AesCryptoButton(
                              title: 'Decrypt',
                              isEncrypt: false,
                            ),
                            const SizedBoxH(15),
                            const AesCryptoPlainText(),
                            const SizedBoxH(15),
                            OutlinedButton(
                              onPressed: () {
                                _dt.rxForm.reset();
                              },
                              child: const Text('Reset'),
                            ),
                            const SizedBoxH(20),
                            const Text('Developed by:'),
                            const Text('Annisa Putri Wahyuni (227006042)'),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
