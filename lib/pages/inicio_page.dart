import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InicioPage extends StatefulWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _InicioPage();
}

class _InicioPage extends State<InicioPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ABC Tech Service'), automaticallyImplyLeading: false),
        body: Container(
            constraints: const BoxConstraints.expand(),
            padding: const EdgeInsets.all(10.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: const EdgeInsets.only(top: 40.0, bottom: 8.0),
                  padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                  child: Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _routePage("/login", context),
                        child: const Text("Acessar App",
                            style: TextStyle(fontSize: 18.0)),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),
                        ),
                      )
                    )
                  ])),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, left: 40.0),
                child: Row(children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _routePage("/new", context),
                    child: const Text("Cadastrar novo usuário", style: TextStyle(fontSize: 18.0)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      primary: Colors.red[300]
                    )
                  )
                )
              ])
              )
            ])));
  }

  _routePage(String url, BuildContext context) {
    FocusScope.of(context).unfocus();
    Get.toNamed(url);
  }

}
