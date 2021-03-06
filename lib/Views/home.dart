import 'package:appthoviet/Views/thoDienNuoc.dart';
import 'package:appthoviet/Views/thoNLMT.dart';
import "package:flutter/material.dart";
import 'thoChongTham.dart';
import 'thoDien.dart';
import 'thoMoc.dart';
import 'thoDienLanh.dart';
import 'thongNghet.dart';
import 'thoSuaMayLanh.dart';
import 'thoSuaNha.dart';
import 'vsBeNuoc.dart';
import 'thoDoNuocRoRi.dart';
import 'package:appthoviet/ViewModels/Fab_con.dart';

var url = 'lib/images/';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trang Chủ'),
        centerTitle: true,
      ),
      body: HomeWidget(),
      floatingActionButton: FabCon(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  static String routeName = 'views/Home';

  @override
  State<StatefulWidget> createState() => HomeStateWidget();
}

class HomeStateWidget extends State<HomeWidget> {
  Widget titleSection = new ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    child: Image.asset(
      url + 'tapthecty.png',
      fit: BoxFit.cover,
      height: 200,
      width: 400,
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      color: Colors.white,
      child: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          titleSection,
          Padding(padding: EdgeInsets.all(5)),
          Card(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Dịch Vụ Sửa Chữa Thợ Việt'),
                  ]),
            ),
          ),
          Card(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(5),
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0,
                shrinkWrap: true,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThoDien()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoDien.png',
                          titleDVTV: 'Thợ Điện',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThoDienLanh()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoDL.png',
                          titleDVTV: 'Thợ Điện Lạnh',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ThoDienNuoc(),
                            // builder: (context) => ExampleForm(),
                          ),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoNuoc.png',
                          titleDVTV: 'Thợ Nước',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThoMoc()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoMoc.png',
                          titleDVTV: 'Thợ Mộc',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThoThongNghet()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoThongNghet.png',
                          titleDVTV: 'Thông Nghẹt',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ThoChongTham()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoDoRoRi.png',
                          titleDVTV: 'Chống Thấm',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DoNuocRoRi()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'thoDoRoRi.png',
                          titleDVTV: 'Dò Nước Rò Rỉ',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VSBN()),
                        );
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'vsbn.png',
                          titleDVTV: 'VS Bể Nước',
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        _dVkhac(context);
                      },
                      splashColor: Colors.green[200],
                      child: Center(
                        child: DVTV(
                          urlDVTV: url + 'dvKhac.png',
                          titleDVTV: 'Thợ Khác',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.blue[400],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black12),
                borderRadius: BorderRadius.circular(5)),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Giảm giá 10% \n cho dịch vụ sửa điện nước hộ gia đình!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ),
          Image.asset(
            url + 'phieuGiamGia.jpg',
            fit: BoxFit.cover,
          ),
        ],
      ),
    ));
  }
}

void _dVkhac(context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext bc) {
      return Container(
        clipBehavior: Clip.none,
        color: Color(0xFF737373),
        height: 500,
        child: new Container(
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(15),
                topRight: const Radius.circular(15),
              ),
            ),
            child: new Row(
              children: <Widget>[
                new Expanded(
                    child: new Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(150, 5, 150, 5),
                      child: new Divider(
                        height: 15.0,
                        color: Colors.grey[300],
                        indent: 5.0,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: new Text(
                          'Khám phá dịch vụ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        )),
                    new GridView.count(
                      primary: false,
                      padding: const EdgeInsets.all(10),
                      crossAxisCount: 4,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      shrinkWrap: true,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TabBarNLMT()),
                              );
                            },
                            splashColor: Colors.green[200],
                            child: Center(
                              child: DVTV(
                                urlDVTV: url + 'thoPMT.png',
                                titleDVTV: 'NL Mặt Trời',
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThoSuaNha()),
                              );
                            },
                            splashColor: Colors.green[200],
                            child: Center(
                              child: DVTV(
                                urlDVTV: url + 'thoSuaNha.png',
                                titleDVTV: 'Thợ Sửa Nhà',
                              ),
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThoSuaMayLanh()),
                              );
                            },
                            splashColor: Colors.green[200],
                            child: Center(
                              child: DVTV(
                                urlDVTV: url + 'thoSuaML.png',
                                titleDVTV: 'Sửa Máy Lạnh',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
      );
    },
  );
}

class DVTV extends StatelessWidget {
  DVTV({this.urlDVTV, this.titleDVTV});

  final String urlDVTV;
  final String titleDVTV;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new Column(
          children: [
            Image.asset(
              urlDVTV,
              width: 55,
              height: 55,
              fit: BoxFit.cover,
            ),
            new Text(
              titleDVTV,
              style: TextStyle(
                fontSize: 11,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
