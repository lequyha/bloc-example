import 'package:flutter/material.dart';
import 'package:flutter_application_13/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (previous, current) =>
                    previous.email != current.email,
                builder: (context, state) {
                  return TextFormField(
                    initialValue: state.email,
                    onChanged: (value) {
                      context.read<LoginBloc>().add(OnChangeEmail(value));
                    },
                    decoration: InputDecoration(
                      errorText: state.emailError,
                    ),
                  );
                },
              ),
              BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                  return Visibility(
                    visible: state.email.isNotEmpty,
                    child: TextFormField(
                      initialValue: state.password,
                      onChanged: (value) {
                        context.read<LoginBloc>().add(OnChangePassword(value));
                      },
                      decoration: InputDecoration(
                        errorText: state.passwordError,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<LoginBloc>().add(const Submit());
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          },
        ),
      ),
    );
  }
}
