import 'package:demo_app/screens/myhome.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/num_converter_model.dart';

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<NumConverter>(
        create: (context) => NumConverter(
            binary: "", decimal: "", currentMethod: "Binary -> Decimal"),
        child: MyHome());
  }
}

void main() => runApp(MainWidget());
