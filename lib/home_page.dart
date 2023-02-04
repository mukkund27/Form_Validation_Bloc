import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/Bloc/SigninBloc.dart';
import 'package:form_validation_bloc/Bloc/SigninEvent.dart';
import 'package:form_validation_bloc/Bloc/SigninState.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Enter Details"),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: BlocBuilder<SigninBloc, SigninState>(
              builder: (BuildContext context, state) {
                if (state is SigninErrorState) {
                  return Text(
                    state.errorMessage,
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
          Container(
            height: 55,
            color: Colors.grey.shade200,
            margin: EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context)
                    .add(SignInTextChangeEvent(_email.text, _password.text));
              },
              controller: _email,
              decoration: InputDecoration(
                  hintText: "Enter Email",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          Container(
            height: 55,
            color: Colors.grey.shade200,
            margin: EdgeInsets.all(12),
            child: TextField(
              onChanged: (value) {
                BlocProvider.of<SigninBloc>(context)
                    .add(SignInTextChangeEvent(_email.text, _password.text));
              },
              controller: _password,
              decoration: InputDecoration(
                  hintText: "Enter Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: BlocBuilder<SigninBloc, SigninState>(
              builder: (BuildContext context, state) {
                if (state is SignInLoadingState) {
                  return Center(child: CircularProgressIndicator());
                }
                return CupertinoButton(
                  onPressed: () {
                    if (state is SigninValidState) {
                      BlocProvider.of<SigninBloc>(context).add(
                          SigninSubmittedEvent(_email.text, _password.text));
                    }
                  },
                  child: Text("Submit"),
                  color:
                      (state is SigninValidState) ? Colors.blue : Colors.grey,
                );
              },
            ),
          )
        ],
      )),
    );
  }
}
