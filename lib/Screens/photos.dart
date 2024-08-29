import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/Provider/provider.dart';

class PhotosScreen extends ConsumerWidget {
  const PhotosScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photosPro = ref.watch(photosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photos'),
      ),
      body: photosPro.when(
        data: (data) {
          return ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              final photo = data[index];
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(photo.thumbnailUrl),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.network(photo.imageUrl),
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'albumId:  ${photo.albumId}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Id:  ${photo.id}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        error: (_, __) {
          return const Center(
            child: Text('Error!!!'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
