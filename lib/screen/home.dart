import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_crud/notifier/notifier.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(crudNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text("Riverpod CRUD"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Card(
              elevation: 3,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item,
                        style: TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ref.read(crudNotifierProvider.notifier).remove(item);
                      },
                      child: Text(
                        "Delete",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        final updated = "Double ${Random().nextDouble().toStringAsFixed(2)}";
                        ref.read(crudNotifierProvider.notifier).update(item, updated);
                      },
                      child: Text(
                        "Double",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(crudNotifierProvider.notifier).add("Number ${Random().nextInt(100)}");
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
