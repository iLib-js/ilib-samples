import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_js/flutter_js.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  final JavascriptRuntime jsRuntime =
      getJavascriptRuntime(forceJavascriptCoreOnAndroid: false);
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  dynamic curLocale = "locale";
  dynamic ilibresult = "result";
  JavascriptRuntime runtime = getJavascriptRuntime();
  //dynamic ilib = rootBundle.loadString("assets/js/ilib-standard-flutter.js");
  dynamic ilib = rootBundle.loadString("assets/js/ilib-standard-flutter-compiled.js");
  
  @override
  Widget build(BuildContext context) {
    Color c = Theme.of(context).primaryColor;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('iLib Test Sample'),
        ),
        body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                curLocale,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                ilibresult,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                "DateTimeFmt",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateTimeFormat(runtime, "en-US");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-US")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateTimeFormat(runtime, "en-GB");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-GB")),
                SizedBox(width: 10),  
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateTimeFormat(runtime, "ko-KR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("ko-KR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateTimeFormat(runtime, "fa-IR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("fa-IR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateTimeFormat(runtime, "am-ET");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("am-ET")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                "DateFmt",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateFormat(runtime, "en-US");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-US")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateFormat(runtime, "en-GB");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-GB")),
                SizedBox(width: 10),  
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateFormat(runtime, "ko-KR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("ko-KR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateFormat(runtime, "fa-IR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("fa-IR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getDateFormat(runtime, "am-ET");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("am-ET")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                "Default Calendar",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getCalendar(runtime, "en-US");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-US")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getCalendar(runtime, "en-GB");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-GB")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getCalendar(runtime, "ko-KR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("ko-KR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getCalendar(runtime, "fa-IR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("fa-IR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getCalendar(runtime, "am-ET");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("am-ET")),  
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                "Default Clock",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getClock(runtime, "en-US");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-US")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getClock(runtime, "en-GB");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("en-GB")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getClock(runtime, "ko-KR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("ko-KR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getClock(runtime, "fa-IR");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("fa-IR")),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final result = await getClock(runtime, "am-ET");
                    setState(() {
                      ilibresult = result;
                    });
                  },
                  child: Text("am-ET")),  
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
  dynamic getDateTimeFormat(JavascriptRuntime runtime, dynamic curlo) async {
    final jsiLibFile = await ilib;
    dynamic options = '{locale: "$curlo", length: "full", useNative:false, type: "datetime", timezone: "local"}';
    dynamic year = 2024;
    dynamic month = 3;
    dynamic day = 11;
    dynamic hour = 15;
    dynamic minute = 38;
    dynamic dateOptions = '{year:"$year", month:"$month", day:"$day", hour:"$hour", minut:"$minute", calendar:"gregorian"}';
    
    JsEvalResult jsEvalResult =
        runtime.evaluate("""${jsiLibFile}new DateFmt($options).format(DateFactory($dateOptions))""");
    curLocale = curlo;
    return jsEvalResult.stringResult;
  }
  dynamic getDateFormat(JavascriptRuntime runtime, dynamic curlo) async {
    final jsiLibFile = await ilib;
    dynamic options = '{locale: "$curlo", length: "full", useNative:false, timezone: "local"}';
    dynamic year = 2024;
    dynamic month = 3;
    dynamic day = 11;
    dynamic hour = 15;
    dynamic minute = 38;
    dynamic dateOptions = '{year:"$year", month:"$month", day:"$day", hour:"$hour", minut:"$minute", calendar:"gregorian"}';
    
    JsEvalResult jsEvalResult =
        runtime.evaluate("""${jsiLibFile}new DateFmt($options).format(DateFactory($dateOptions))""");
    curLocale = curlo;
    return jsEvalResult.stringResult;
  }
  dynamic getCalendar(JavascriptRuntime runtime, dynamic curlo) async {
    final jsiLibFile = await ilib;
    JsEvalResult defaultCalendar =
        runtime.evaluate("""${jsiLibFile}new LocaleInfo("$curlo").getCalendar()""");
    curLocale = curlo;
    return defaultCalendar.stringResult;
  }
  dynamic getClock(JavascriptRuntime runtime, dynamic curlo) async {
    final jsiLibFile = await ilib;
    JsEvalResult defaultCalendar =
        runtime.evaluate("""${jsiLibFile}new LocaleInfo("$curlo").getClock()""");
    curLocale = curlo;
    return defaultCalendar.stringResult;
  }
}