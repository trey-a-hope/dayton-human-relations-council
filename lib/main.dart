import 'package:dayton_human_relations_council/complaint_form/complaint_form_bloc.dart';
import 'package:dayton_human_relations_council/complaint_form/complaint_form_page.dart';
import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocater();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
