import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        backgroundColor: Colors.transparent,
        //primarySwatch: Colors.blue,
        //visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String page = 'home';
  List showRows = [0, 2];
  int tablePage = 1;
  List tablePages = [];
  bool showAllRows = false;
  bool sortToggle = true;
  List columns = [
    {'title': 'ФИО студента', 'type': 'string'},
    {'title': 'Год набора', 'type': 'string'},
    {'title': 'Код группы', 'type': 'string'},
    {'title': 'Номер зачеeeeeeeeтки', 'type': 'string'},
    {'title': 'Email', 'type': 'string'},
    {'title': 'Икооона', 'type': 'icon'},
  ];

  List startRows = [
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.pan_tool))
    },
    {
      'name': 'Иванов Иван ffffffffffffffffffffffff',
      'year': 2017,
      'group': 'В-31',
      'id': 'ЗБВТ-00001',
      'email': 'ivanid@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(
        icon: Icon(Icons.pan_tool),
        onPressed: () => print('aaaaaaa'),
      )
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.pan_tool))
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
  ];

  List rows = [
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.pan_tool))
    },
    {
      'name': 'Иванов Иван ffffffffffffffffffffffff',
      'year': 2017,
      'group': 'В-31',
      'id': 'ЗБВТ-00001',
      'email': 'ivanid@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
    {
      'name': 'Иванов Иван ffffffffffffffffffffffff',
      'year': 2017,
      'group': 'В-31',
      'id': 'ЗБВТ-00001',
      'email': 'ivanid@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
    {
      'name': 'Иванов Иван ffffffffffffffffffffffff',
      'year': 2017,
      'group': 'В-31',
      'id': 'ЗБВТ-00001',
      'email': 'ivanid@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
    {
      'name': 'Иванов Иван ffffffffffffffffffffffff',
      'year': 2017,
      'group': 'В-31',
      'id': 'ЗБВТ-00001',
      'email': 'ivanid@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(
        icon: Icon(Icons.pan_tool),
        onPressed: () => print('aaaaaaa'),
      )
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.pan_tool))
    },
    {
      'name': 'Васильев Василий',
      'year': 2016,
      'group': 'В-41',
      'id': 'ЗБВТ-00002',
      'email': 'vas@gmail.com',
      'icon': IconButton(icon: Icon(Icons.volume_up))
    },
  ];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _cutRows() {
    List localRows = [];
    for (var i = (showAllRows ? 0 : showRows[0]);
        i <
            (showAllRows
                ? startRows.length
                : showRows[1] >= startRows.length
                    ? showRows[1]
                    : startRows.length);
        i++) {
      localRows.add(startRows[i]);
    }
    setState(() {
      rows = localRows;
    });
  }

  void _sortByColumn(columnName) {
    print(columnName);
    List localRows = startRows;
    sortToggle
        ? localRows.sort((a, b) => (b[columnName]).compareTo(a[columnName]))
        : localRows.sort((a, b) => (a[columnName]).compareTo(b[columnName]));

    setState(() {
      sortToggle = !sortToggle;
      rows = localRows;
    });
    _cutRows();
  }

  void _searchByColumn() {
    List localRows = startRows;
    localRows.sort((a, b) => (b['name']).compareTo(a['name']));
    print('aaaaaa');
    setState(() {
      rows = localRows;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //  title: Text(widget.title),
      //),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.13,
                child: _navigationMenu()),
            Container(
                height: MediaQuery.of(context).size.height * 0.85,
                child:
                    Scrollbar(child: SingleChildScrollView(child: _table()))),
            //SizedBox(height: 20)
          ],
        ),
      ),
    );
  }

  Widget _navigationMenu() {
    List data = [
      {'name': 'Главная', 'page': 'home'},
      {'name': 'Учебная деятельность', 'page': 'activities'},
      {'name': 'Студенты', 'page': 'students'},
      {'name': 'Преподаватели', 'page': 'lecturers'},
      {'name': 'Личный кабинет', 'page': 'cabinet'},
      {'name': 'МРС', 'page': 'rating'},
    ];
    return Row(
        children: List.generate(data.length, (i) {
      return InkWell(
        child: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: page == data[i]['page']
                            ? Colors.blue
                            : Colors.blueGrey,
                        width: 7.0))),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '${data[i]['name']}',
                style: TextStyle(
                    color: page == data[i]['page']
                        ? Colors.blueGrey
                        : Colors.black),
              ),
            )),
        onTap: () {
          setState(() {
            page = data[i]['page'];
          });
        },
      );
    }));
  }

  Widget _table() {
    return Center(
        child: Column(children: <Widget>[
      Container(
        margin: EdgeInsets.all(20),
        child: Table(
          //defaultColumnWidth: FixedColumnWidth(120.0),
          border: TableBorder.all(
              color: Colors.white, style: BorderStyle.solid, width: 1),
          children: [
            TableRow(
                children: List.generate(columns.length, (t) {
              return Column(children: [
                Container(
                    //padding: EdgeInsets.all(16.0),
                    height: 76,
                    child: InkWell(
                        onTap: () => _sortByColumn(rows[0].keys.toList()[t]),
                        child: Card(
                            child: Center(
                                child: Text('${columns[t]['title']}',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 20.0))))))
              ]);
            })),
            TableRow(
                children: List.generate(rows[0].keys.toList().length, (c) {
              return Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(rows.length, (r) {
                        return Column(children: [
                          columns[c]['type'] == 'string'
                              ? Container(
                                  //padding: EdgeInsets.all(16.0),
                                  height: 76,
                                  child: Center(
                                      child: Text(
                                          '${rows[r][rows[0].keys.toList()[c]]}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 20.0))))
                              : columns[c]['type'] == 'icon'
                                  ? Container(
                                      padding: EdgeInsets.all(16.0),
                                      height: 76,
                                      child: Center(
                                          child: rows[r]
                                              [rows[0].keys.toList()[c]]))
                                  : Text('---')
                        ]);
                      })));
            })),
            TableRow(
                children: List.generate(columns.length, (t) {
              return Column(children: [TextField()]);
            })),
          ],
        ),
      ),
      CheckboxListTile(
        title: showAllRows
            ? Row(children: [Text("Выводить по: "), select(), Text(' записей')])
            : Text(
                'Выводить все записи',
                style: TextStyle(color: Colors.grey),
              ),
        value: showAllRows,
        onChanged: (newValue) {
          setState(() {
            showAllRows = !showAllRows;
          });
        },
        controlAffinity:
            ListTileControlAffinity.leading, //  <-- leading Checkbox
      )
    ]));
  }

  Widget select() {
    return DropdownButton<String>(
      value: showRows[1].toString(),
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          showRows[1] = int.parse(newValue);
        });
      },
      items: <String>['2', '10', '25', '50', '100']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
/*
class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/
