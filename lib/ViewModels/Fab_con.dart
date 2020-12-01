import 'package:appthoviet/Views/datLich.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';

var urlimg = 'lib/images/';

class FabCon extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    _thongBaoDatLich(BuildContext context) async {
      // Navigator.push returns a Future that completes after calling
      // Navigator.pop on the Selection Screen.
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => DatLich()),
      );
      // After the Selection Screen returns a result, hide any previous snackbars
      // and show the new result.
      if (result != null) {
        Scaffold.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text("$result")));
      }
    }

    return Builder(
      builder: (context) => FabCircularMenu(
        key: fabKey,
        // Cannot be `Alignment.center`
        alignment: Alignment.bottomRight,
        ringColor: Colors.blue[300].withAlpha(500),
        ringDiameter: 300.0,
        ringWidth: 80.0,
        fabSize: 60.0,
        fabElevation: 8.0,
        fabIconBorder: CircleBorder(),
        fabColor: Colors.blue[300],
        fabOpenIcon: Icon(Icons.menu, color: Colors.white),
        fabCloseIcon: Icon(Icons.close, color: Colors.red),
        fabMargin: const EdgeInsets.all(14.0),
        animationDuration: const Duration(milliseconds: 600),
        animationCurve: Curves.easeInOutCirc,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {
              launch(('https://zalo.me/0903532938'));
              if (fabKey.currentState.isOpen) {
                fabKey.currentState.close();
              } else {
                fabKey.currentState.open();
              }
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(30.0),
            child: Image.asset(
              urlimg + 'zalo.png',
              width: 45,
              height: 45,
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              launch('tel:0903532938');
              if (fabKey.currentState.isOpen) {
                fabKey.currentState.close();
              } else {
                fabKey.currentState.open();
              }
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(30.0),
            child: Icon(Icons.call, color: Colors.white),
          ),
          RawMaterialButton(
            onPressed: () {
              _thongBaoDatLich(context);
              if (fabKey.currentState.isOpen) {
                fabKey.currentState.close();
              } else {
                fabKey.currentState.open();
              }
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(30.0),
            child: Icon(Icons.list_alt, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
