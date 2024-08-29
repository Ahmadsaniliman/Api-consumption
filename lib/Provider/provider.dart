import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/Network/network.dart';

final networkProvider = FutureProvider(
  (ref) {
    return Network().getUsers();
  },
);

final todosProvider = FutureProvider(
  (ref) {
    return Network().getTodos();
  },
);

final photosProvider = FutureProvider(
  (ref) {
    return Network().getPhotos();
  },
);

final postsProvider = FutureProvider(
  (ref) {
    return Network().getPosts();
  },
);
