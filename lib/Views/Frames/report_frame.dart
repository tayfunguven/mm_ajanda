import 'package:flutter/material.dart';
import 'package:mm_ajanda/CustomWidgets/project_edit_widget.dart';

class ReportFrame extends StatefulWidget {
  const ReportFrame({Key? key}) : super(key: key);

  @override
  _ReportFrameState createState() => _ReportFrameState();
}

class _ReportFrameState extends State<ReportFrame> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  color: Colors.amber[colorCodes[index]],
                  child:  Center(
                    child: Card(
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: const Icon(Icons.task),
                            title: Text('Proje No: ${entries[index]}'),
                            subtitle: const Text('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor.'),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              TextButton(
                                child: const Text('TAMAMLANDI'),
                                onPressed: () {/* ... */},
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                child: const Text('DÜZENLE'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const ProjectEditWidgetRoute())
                                  );
                                }
                              ),
                              const SizedBox(width: 8),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:50, top:15, right:50, bottom:50),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(121, 135, 119, 1))
              ),
              onPressed: null,
              child: const Text('Proje Ekle', style: TextStyle(color: Colors.white),),
            ),
          ),

        ],
      ),
    );
  }
}
