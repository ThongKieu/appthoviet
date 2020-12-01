import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  String selectedValuedQuan;
  List phuongItemsList = List();
  Future getDataPhuong() async {
    var urlData =
        "http://192.168.1.8:8080/dashboard_app/includes/class/mobile/getDataPhuong.php";
    var resp = await http.get(urlData);
    if (resp.statusCode == 200) {
      var jsonData = json.decode(resp.body);
      setState(() {
        phuongItemsList = jsonData;
      });
    }
    print(phuongItemsList);
  }

  @override
  void initState() {
    super.initState();
    getDataPhuong();
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        child: DropdownButton(
                          isExpanded: true,
                          hint: Text("Chọn Quận"),
                          value: selectedValuedQuan,
                          items: phuongItemsList.map((quan) {
                            return DropdownMenuItem(
                              value: quan['tenquan'],
                              child: Container(
                                child: Column(
                                  children: [Text(quan['tenquan'])],
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValuedQuan = value;
                            });
                          },
                          style: TextStyle(color: Colors.black),
                        ),
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
                                  context, 'Hẹn lại bạn lần sau nhé!');
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
