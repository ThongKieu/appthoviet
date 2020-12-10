import 'dart:convert';
import 'package:appthoviet/Views/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dropdownfield/dropdownfield.dart';
import 'package:date_form_field/date_form_field.dart';

class DatLich extends StatelessWidget {
  getMethod() async {
    String url =
        "http://192.168.1.8:8080/dashboard_app/pages/mobile/getData.php";
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
  TextEditingController diaChiControll = TextEditingController();
  String get diaChiCont => diaChiControll.text;
  TextEditingController ngayDatControll = TextEditingController();
  String get dateCont => ngayDatControll.text;
  String selectedValuedQuan = "";
  insertMethod() async {
    String theUrl = "http://192.168.1.8:8080/1/pages/mobile/insertData.php";
    var res = await http.post(
      Uri.encodeFull(theUrl),
      headers: {"Accept": "application/json"},
      body: {
        "yccvCont": yccvCont,
        "tenCont": tenCont,
        "sdtCont": sdtCont,
        "quanCont": quanCont,
        "diaChiCont": diaChiCont,
        "dateCont": dateCont,
      },
    );
    var respBody = json.decode(res.body);
    print(respBody);
  }

  // ngay book
  DateTime initialDate = DateTime.now();
  DateTime firstDate = DateTime.now();
  DateTime lastDate = DateTime(2100);
  Future<DateTime> showPicker() async {
    DateTime date = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    return date;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10,
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
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          cursorHeight: 15,
                          controller: tenControll,
                          decoration: InputDecoration(
                            labelText: 'Tên',
                            helperText: 'Vd: A. Tam, C. Ngoc,...',
                            hintText: 'Tên bạn là đẹp nhất!',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: TextFormField(
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
                            helperText: 'Vd: 0903.532.938',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: TextFormField(
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
                            helperText: 'Vd: Sửa ống nước, sửa tủ lạnh,.v.v..',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        child: TextFormField(
                          controller: diaChiControll,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Bạn quên nhập địa chỉ rồi!';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Địa chỉ',
                            helperText: 'Vd: 184 Nguyến Xí, p26',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 5,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[600],
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: DropDownField(
                              controller: quanControll,
                              hintText: "Chọn quận/ huyện",
                              enabled: true,
                              items: quan,
                              onValueChanged: (value) {
                                setState(
                                  () {
                                    selectedValuedQuan = value;
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 5,
                        ),
                        child: DateFormField(
                          format: 'dd-MM-yyyy',
                          controller: ngayDatControll,
                          showPicker: showPicker,
                          decoration: InputDecoration(
                            labelText: 'Chọn ngày',
                             contentPadding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      GridView.count(
                        primary: false,
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        crossAxisSpacing: 5.0,
                        mainAxisSpacing: 5.0,
                        shrinkWrap: true,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: RaisedButton(
                              elevation: 5,
                              textColor: Colors.white,
                              color: Colors.blueAccent,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  return showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(
                                            "Cảm ơn quý khách hàng đã đặt lịch!"),
                                        actions: [
                                          FlatButton(
                                            onPressed: () {
                                              insertMethod();
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HomePage()),
                                                      (route) => false);
                                            },
                                            child: Text("Xác nhận"),
                                          )
                                        ],
                                        elevation: 24,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      );
                                    },
                                  );
                                } else {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Bạn đã nhập sai thông tin!'),
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
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            child: RaisedButton(
                              elevation: 5,
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

List<String> quan = [
  "Quận 1",
  "Quận 2",
  "Quận 3",
  "Quận 4",
  "Quận 5",
  "Quận 6",
  "Quận 7",
  "Quận 8",
  "Quận 9",
  "Quận 10",
  "Quận 11",
  "Quận 12",
  "Quận Thủ Đức",
  "Quận Gò Vấp",
  "Quận Bình Thạnh",
  "Quận Bình Tân",
  "Quận Tân Phú",
  "Quận Phú Nhuận",
  "Quận Tân Bình",
  "Huyện Củ Chi",
  "Huyện Hóc Môn",
  "Huyện Bình Chánh",
  "Huyện Nhà Bè",
];
