import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'main.dart';
import 'editargs.dart';

class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<StatefulWidget> createState() => _AddState();
}

class _AddState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final ScreenArguments? args =
        ModalRoute.of(context)!.settings.arguments as ScreenArguments?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Homework"),
      ),
      body: _buildBody(args),
    );
  }

  _buildBody(ScreenArguments? args) {
    return Form(
      key: _formKey,
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.house),
                  labelText: "Homework Name",
                ),
                onSaved: (value) {
                  if (args != null) {
                    homeworkList[args.index] = value!;
                  } else {
                    homeworkList.add(value!);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a homework name';
                  }
                  return null;
                },
                maxLength: 100,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
