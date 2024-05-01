import 'package:clipboard/clipboard.dart';
import 'package:crypto_app/ui_widgets/spaces/_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

import '../../app/_index.dart';
import '../../xtras/_index.dart';

part 'a.aes_crypto.data.dart';
part 'b.aes_crypto.ctrl.dart';
part 'c.aes_crypto.view.dart';
part 'widgets/a.aes_crypto.appbar.dart';
part 'widgets/b.aes_crypto.fab.dart';
part 'widgets/c.aes_crypto.text.dart';
part 'widgets/d.aes_crypto.secret_key.dart';
part 'widgets/e.aes_crypto.cipher_text.dart';
part 'widgets/f.aes_crypto.plain_text.dart';

AesCryptoData get _dt => Data.aesCrypto.st;
AesCryptoCtrl get _ct => Ctrl.aesCrypto;
