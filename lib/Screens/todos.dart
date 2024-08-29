import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jsonapiintergation/Provider/provider.dart';

class TodosScreen extends ConsumerWidget {
  const TodosScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todosPro = ref.watch(todosProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: todosPro.when(data: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final todo = data[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'UserId:  ${todo.userId}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Id:  ${todo.id}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Title:  ${todo.title}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      'Completed:  ${todo.completed}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
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
          child: Text('Error'),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }),
    );
  }
}
