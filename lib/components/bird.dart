import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  const Bird({super.key});

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> {
  // 'O ruu ni cämö',
  //   'O cämö ki wïth caami mo thööth',
  //   'O ruu ni bäng gïn mo ee camø',
  //   'O määthö ki pïï mo thööth' Akëëlö
  List<Map<String, String>> birds = [
    {
      'engName': 'Hamerkop',
      'anyName': 'Aciik',
      'imageLink': "assets/birds/aciik.png"
    },
    {
      'engName': 'Village weaver',
      'anyName': 'Aleerø',
      'imageLink': "assets/birds/aleero.png"
    },
    {
      'engName': 'Butterfly',
      'anyName': 'Adeellakwac',
      'imageLink': 'assets/birds/butterfly.png'
    },

    {
      'engName': 'Duck',
      'anyName': 'Badhø',
      'imageLink': 'assets/birds/duck.png'
    },

    // 'O ruu ni cämö',
    //   'O cämö ki wïth caami mo thööth',
    //   'O ruu ni bäng gïn mo ee camø',
    //   'O määthö ki pïï mo thööth' Akëëlö

    {
      'engName': 'Fish eagle',
      'anyName': 'Dibëël',
      'imageLink': 'assets/birds/fish_eagle.png'
    },
    {
      'engName': 'Hen',
      'anyName': 'Gwienø',
      'imageLink': 'assets/birds/gwieno.png'
    },
    {
      'engName': 'Cattle Egret',
      'anyName': 'Okøøk',
      'imageLink': 'assets/birds/okook.png'
    },
    {
      'engName': 'Plegadis',
      'anyName': 'Owaaw',
      'imageLink': 'assets/birds/owaaw.png'
    },
    {
      'engName': 'Pelican',
      'anyName': 'Obööngö',
      'imageLink': 'assets/birds/pelican.png'
    },
    {
      'engName': 'Standard nightjar',
      'anyName': 'Obwölatäämmö',
      'imageLink': 'assets/birds/standard_nightjar.png'
      //määthö
    },
    {'engName': 'Owl', 'anyName': 'Tula', 'imageLink': 'assets/birds/tula.png'},
    {
      'engName': 'Dove',
      'anyName': 'Akuuru',
      'imageLink': 'assets/birds/white_dove.png'
    },
  ];
  bool zoom = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // amiriga
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
      ),
      body: zoom
          ? Column(
              children: [
                ListTile(
                  //Cöörä
                  title: Text(
                    'winy',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  subtitle: Text(
                    'Birds',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.zoom_out_map_outlined),
                    onPressed: () {
                      setState(() {
                        zoom = !zoom;
                      });
                    },
                  ),
                ),
                Container(
                    child: Image.asset(
                  birds[index]['imageLink']!,
                  height: 400,
                )),
                ListTile(
                  title: Text(
                    birds[index]['anyName']!,
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    birds[index]['engName']!,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (index > 0) {
                            setState(() {
                              index = index - 1;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.chevron_left_outlined,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow_sharp,
                          size: 50,
                        )),
                    IconButton(
                        onPressed: () {
                          if (index < birds.length - 1) {
                            setState(() {
                              index = index + 1;
                            });
                          }
                        },
                        icon: Icon(
                          Icons.chevron_right_outlined,
                          size: 50,
                        )),
                  ],
                )
              ],
            )
          : Padding(
              padding: EdgeInsets.all(15),
              child: Column(children: [
                ListTile(
                  title: Text(
                    'Birds',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  subtitle: Text(
                    'Winy',
                    style: TextStyle(fontSize: 20, color: Colors.grey[700]),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.zoom_out_map_outlined),
                    onPressed: () {
                      setState(() {
                        zoom = !zoom;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                      birds.length,
                      (index) => Card(
                            child: GestureDetector(
                              // onTap: () {
                              //   Navigator.pushNamed(
                              //       context, '${birds[index]['route']}');
                              // },
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                        '${birds[index]['imageLink']}'),
                                  ),
                                  ListTile(
                                    subtitle: Text(
                                      '${birds[index]['engName']}',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    title: Text(
                                      '${birds[index]['anyName']}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                ))
              ]),
            ),
    );
  }
}
