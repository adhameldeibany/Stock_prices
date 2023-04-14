import 'package:flutter/material.dart';
import 'package:project_with_api/Network/dio_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getGoldPrice();
    getSilverPrice();
  }

  @override
  Widget build(BuildContext context) {
    getGoldPrice();
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text('TODAY',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(
                          1,1
                        ),
                        blurRadius: 5
                    )
                  ]
              ),
            ),
            Text(' PRICE',
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  shadows: [
                    BoxShadow(
                        color: Colors.orange[200]!,
                        offset: Offset(
                          1,1
                        ),
                        blurRadius: 5
                    )
                  ]
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50,),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Image.asset('assets/gold.png',
                height: 150,
                  width: 150,
                ),
                Text('GOLD',
                style: TextStyle(
                  color: Colors.orange,
                    fontSize: 33,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      BoxShadow(
                          color: Colors.orange[300]!,
                          offset: Offset(
                              2,2
                          ),
                          blurRadius: 5
                      )
                    ]
                ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('$goldD',
                      style: TextStyle(
                        color: Colors.orange,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text('EGP',
                      style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                Image.asset('assets/silver.png',
                  height: 150,
                  width: 150,
                ),
                Text('SILVER',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 33,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(
                                2,2
                            ),
                          blurRadius: 5
                        )
                      ]
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('$silverD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(width: 6,),
                    Text('EGP',
                      style: TextStyle(
                          color: Colors.green[500],
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  double? goldD;
  int? goldI;

  double? silverD;
  int? silverI;

  getGoldPrice(){
    DioHelper.getData('XAU/EGP/').then((value) {
      setState(() {
        goldD = value.data['price_gram_24k'];
        goldI = goldD!.round();
        print(goldI);
      });
    }).catchError((error){});
  }
  getSilverPrice(){
    DioHelper.getData('XAG/EGP/').then((value) {
      setState(() {
        silverD = value.data['price_gram_24k'];
        silverI = silverD!.round();
        print(silverI);
      });
    }).catchError((error){});
  }
}
