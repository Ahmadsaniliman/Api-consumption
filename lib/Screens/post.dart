import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/Provider/provider.dart';

class PostScreen extends ConsumerWidget {
  const PostScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsPro = ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: postsPro.when(data: (data) {
        return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            final post = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Container(
                padding: const EdgeInsets.all(10),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Id:  ${post.id}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Title:  ${post.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Body:  ${post.body}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }, error: (_, __) {
        return const Center(
          child: Text('Error!!!'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
