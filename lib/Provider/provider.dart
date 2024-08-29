import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/Network/network.dart';

final networkProvider = FutureProvider(
  (ref) => Network().getUsers(),
);
