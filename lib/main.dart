import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/complaint_form/complaint_form_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocater();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (BuildContext context) => ComplaintFormBloc(),
        child: ComplaintFormPage(),
      ),
    );
  }
}
