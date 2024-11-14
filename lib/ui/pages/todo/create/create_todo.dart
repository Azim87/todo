import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/configs/di/di_container.dart';
import 'package:todo/core/utils/ext.dart';
import 'package:todo/ui/components/todo_form_field.dart';
import 'package:todo/ui/pages/todo/create/create_todo_cubit.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({super.key});

  final _formKey = GlobalKey<FormState>();
  final _cubit = getIt<CreateTodoCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Create Todo')),
        body: SafeArea(
          child: BlocBuilder<CreateTodoCubit, CreateTodoState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state.loading) {
                return const Center(child: CircularProgressIndicator.adaptive());
              }
              return Form(
                key: _formKey,
                child: Column(
                  children: [
                    TodoFormField(
                      titleValidator: (val) => val!.isEmpty ? 'Cannot be empty' : null,
                      descriptionValidator: (val) => val!.isEmpty ? 'Cannot be empty' : null,
                      onTitleSaved: (newValue) => _cubit.onTitleSave(newValue),
                      onDescriptionSaved: (newValue) => _cubit.onDescriptionSave(newValue),
                    ),
                    const Spacer(),
                    FilledButton(
                      onPressed: () => _formKey.validateAndSave(() => _cubit.onCreate()),
                      child: const Text('Create'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      );
}
