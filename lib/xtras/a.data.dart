part of '_index.dart';

abstract class Data {
  static Injected<AesCryptoData> get aesCrypto => _aesCryptoData;
}

final _aesCryptoData = RM1.inj(AesCryptoData(), Ctrl.aesCrypto.init);
