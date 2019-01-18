import 'package:flutter/material.dart';
import 'package:ribbon/ribbon.dart';

void main() {
  runApp(MaterialApp(
    title: "ribbon demo",
    theme: ThemeData.light(),
    home: DemoPage(),
    // debugShowMaterialGrid:true,
    debugShowCheckedModeBanner: false,
  ));
}

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  double nearLength = 80;
  double farLength = 120;
  Color color = Colors.redAccent;
  RibbonLocation location = RibbonLocation.topStart;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ribbon Demo'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Ribbon(
                nearLength: nearLength,
                farLength: farLength,
                title: 'New!',
                titleStyle: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                color: Colors.redAccent,
                location: location,
                child: Container(
                    width: 300,
                    height: 160,
                    color:Colors.blueAccent,
                    child: Center(
                        child: Text(
                      'hello ribbon',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ))),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                'RibbonLocation:',
                style: TextStyle(color: Colors.black),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildRadio('topStart', RibbonLocation.topStart),
                  _buildRadio('topEnd', RibbonLocation.topEnd),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildRadio('bottomStart', RibbonLocation.bottomStart),
                  _buildRadio('bottomEnd', RibbonLocation.bottomEnd),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('nearLength:'),
                  Slider(
                    value: nearLength,
                    onChanged: (double value) {
                      setState(() {
                        nearLength = value;
                      });
                    },
                    label: 'nearLength',
                    min: 0,
                    max: 280,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('farLength:'),
                  Slider(
                    value: farLength,
                    onChanged: (double value) {
                      setState(() {
                        farLength = value;
                      });
                    },
                    label: 'nearLength',
                    min: 20,
                    max: 300,
                  ),
                ],
              ),
            ]),
      ),
    );
  }

  _buildRadio(String text, RibbonLocation value) {
    return Row(
      children: <Widget>[
        Text(text),
        Radio<RibbonLocation>(
            value: value,
            groupValue: location,
            onChanged: (RibbonLocation value) {
              setState(() {
                location = value;
              });
            }),
      ],
    );
  }
}
