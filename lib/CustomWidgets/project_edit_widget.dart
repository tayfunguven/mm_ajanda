import 'package:flutter/material.dart';

class ProjectEditWidgetRoute extends StatefulWidget {
  const ProjectEditWidgetRoute({Key? key}) : super(key: key);

  @override
  _ProjectWidgetRouteState createState() => _ProjectWidgetRouteState();
}

class _ProjectWidgetRouteState extends State<ProjectEditWidgetRoute> {
  final List<String> dates = <String>['02', '03', '04', '05', '06'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Proje Düzenle'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      // leading: Icon(Icons.album),
                      title: Text('Proje Adı: The Enchanted Nightingale'),
                      subtitle: Text('Açıklama: Music by Julie Gable. Lyrics by Sidney Stein.'),
                      trailing: Text('Tarih: 01/01/2022'),
                    ),
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const <Widget>[
                          Text('Teslim Tarihi: 01/02/2022'),
                          Text('Statü: Takipte'),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('DÜZENLE'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const LinearProgressIndicator(
                      value: 0.2,
                      color: Colors.blue,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                      semanticsLabel: 'Linear progress indicator',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: dates.length,
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemBuilder: (BuildContext context, int index) {

                    return Card(
                      child: ListTile(
                        leading: const FlutterLogo(size: 72.0),
                        title: Text('Güncelleme Tarihi: ${dates[index]}/01/2022'),
                        subtitle: const Text(
                            'A sufficiently long subtitle warrants three lines.'
                        ),
                        trailing: const Icon(Icons.more_vert),
                        isThreeLine: true,
                      ),
                    );
                  },
                ),
              )
            ],
          )

        ),
      floatingActionButton: const FloatingActionButton.extended(
        onPressed: null,
        backgroundColor: Colors.green,
        label: Text('Rapor Ekle'),
        icon: Icon(Icons.add),
      ),
    );
  }
}
