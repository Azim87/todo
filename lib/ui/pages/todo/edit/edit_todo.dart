import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/core/utils/ext.dart';
import 'package:todo/data/model/todo/todo_response.dart';
import 'package:todo/ui/components/edit_form_field.dart';
import 'package:todo/ui/pages/todo/edit/edit_todo_cubit.dart';

class EditTodo extends StatefulWidget {
  const EditTodo({super.key, required this.data});

  final TodoData data;

  @override
  State<EditTodo> createState() => _EditTodoState();
}

class _EditTodoState extends State<EditTodo> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<EditTodoCubit>();

  @override
  void initState() {
    titleController.text = widget.data.title!;
    descriptionController.text = widget.data.description!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('Edit Todo ${widget.data.title}')),
        body: SafeArea(
          child: BlocBuilder<EditTodoCubit, EditTodoState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              return Column(
                children: [
                  Form(
                    key: _formKey,
                    child: EditFormField(
                      c1: titleController,
                      c2: descriptionController,
                      onTitleSaved: (String? newValue) => _cubit.onEditTitle(newValue),
                      onDescriptionSaved: (String? newValue) => _cubit.onEditDescription(newValue),
                      titleValidator: (val) => val!.isEmpty ? 'Cannot be empty' : null,
                      descriptionValidator: (val) => val!.isEmpty ? 'Cannot be empty' : null,
                    ),
                  ),
                  const Spacer(),
                  FilledButton(
                    onPressed: () => _formKey.validateAndSave(() {
                      if (widget.data.title != titleController.text || widget.data.description != descriptionController.text) {
                        _cubit.onEdit(widget.data.id ?? 0);
                      }
                    }),
                    child: const Text('Edit'),
                  ),
                ],
              );
            },
          ),
        ),
      );
}
