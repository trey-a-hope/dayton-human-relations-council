import 'package:dayton_human_relations_council/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info/package_info.dart';
import 'blocs/complaint_form/complaint_form_bloc.dart';
import 'constants.dart';
import 'package:new_version/new_version.dart';

final _newVersion = NewVersion();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setUpLocator();

  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  version = packageInfo.version;
  buildNumber = packageInfo.buildNumber;

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _newVersion.showAlertIfNecessary(context: context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
