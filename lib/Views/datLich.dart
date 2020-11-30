import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dropdownfield/dropdownfield.dart';

class DatLich extends StatelessWidget {
  getMethod() async {
    String url =
        "http://192.168.1.8:8080/dashboard_app/includes/class/mobile/getData.php";
    var res = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
    var responsBody = json.decode(res.body);
    // print(responsBody);
    return responsBody;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt Lịch'),
        centerTitle: true,
      ),
      body: DatLichWidget(),
    );
  }
}

class DatLichWidget extends StatefulWidget {
  @override
  _DatLichWidgetState createState() => _DatLichWidgetState();
}

class _DatLichWidgetState extends State<DatLichWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController yccvControll = TextEditingController();
  String get yccvCont => yccvControll.text;
  TextEditingController tenControll = TextEditingController();
  String get tenCont => tenControll.text;
  TextEditingController sdtControll = TextEditingController();
  String get sdtCont => sdtControll.text;
  TextEditingController quanControll = TextEditingController();
  String get quanCont => quanControll.text;
  TextEditingController phuongControll = TextEditingController();
  String get phuongCont => phuongControll.text;
  TextEditingController diaChiControll = TextEditingController();
  String get diaChiCont => diaChiControll.text;
  insertMethod() async {
    String theUrl =
        "http://192.168.1.8:8080/dashboard_app/includes/class/mobile/insertData.php";
    var res = await http.post(
      Uri.encodeFull(theUrl),
      headers: {"Accept": "application/json"},
      body: {
        "yccvCont": yccvCont,
        "tenCont": tenCont,
        "sdtCont": sdtCont,
        "quanCont": quanCont,
        "phuongCont": phuongCont,
        "diaChiCont": diaChiCont,
      },
    );
    var respBody = json.decode(res.body);
    print(respBody);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                  side: BorderSide(color: Colors.grey[300]),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(
                        'Thông Tin Đặt Lịch',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Divider(),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        controller: yccvControll,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Quên nhập yêu cầu rồi nè!';
                          } else if (value.length < 3) {
                            return 'Tên Phải dài hơn 3 ký tự';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Yêu cầu công việc',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        controller: tenControll,
                        decoration: InputDecoration(
                          labelText: 'Tên',
                          hintText: 'Tên bạn là đẹp nhất!',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        controller: sdtControll,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Không được để trống đâu!';
                          } else if (value.length < 9 || value.length > 12) {
                            return 'SĐT không đúng';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Số điện thoại',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        shrinkWrap: true,
                        children: <Widget>[
                          TextFormField(
                            controller: quanControll,
                            decoration: InputDecoration(
                              labelText: 'Quận/ huyện',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: phuongControll,
                            decoration: InputDecoration(
                              labelText: 'Phường/ xã',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextFormField(
                        controller: diaChiControll,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Bạn quên nhập địa chỉ rồi!';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Địa chỉ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      DropDownField(
                          value: 'Country',
                          required: false,
                          hintText: 'Choose a country',
                          labelText: 'Country',
                          items: ['qweq'],
                          setter: (dynamic newValue) {}),
                      Padding(padding: EdgeInsets.all(5)),
                      GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        shrinkWrap: true,
                        children: [
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.blueAccent,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                // insertMethod();
                                Navigator.pop(context, 'Thành công!');
                              } else {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Bạn đã nhập sai thông tin!'),
                                  ),
                                );
                              }
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Đặt Lịch",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Colors.red[400],
                            onPressed: () {
                              Navigator.pop(
                                  context, 'Đặt lịch không thành công!');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Thoát",
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
