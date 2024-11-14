import 'package:flutter/material.dart';
import 'package:todo/data/model/todo/todo_response.dart';

class TodoDetails extends StatelessWidget {
  const TodoDetails({super.key, required this.todoData});

  final TodoData todoData;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Todo Details ${todoData.id}'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('${todoData.title}'),
              Text('${todoData.description}'),
            ],
          ),
        ),
      );
}
