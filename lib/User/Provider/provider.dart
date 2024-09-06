import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/User/Network/api_newtwork.dart';

final registerUserProvider = FutureProvider(
  (ref) => NetworkApi().registerUser(
    username: '',
    email: '',
    password: '',
  ),
);
