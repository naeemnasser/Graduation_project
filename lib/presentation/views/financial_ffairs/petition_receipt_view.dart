import 'package:adaa/presentation/views/profile/personal_profile.dart';
import 'package:adaa/presentation/views/screens_admin/loginPage.dart';
import 'package:flutter/material.dart';

import 'financial_ffairs_view.dart';

class TuitionReceiptView extends StatelessWidget {
  const TuitionReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => FinancialAffairsView()),
            );
          },
        ),
        backgroundColor: const Color.fromARGB(255, 192, 233, 243),
        // leading: Image.asset('assets/image.png'),
        title: Row(
          children: [
            Text(
              'Paymant',
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Petition Reequest',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Container(
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  },
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Navigate to Notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to Profile
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.info_outline_rounded),
            onPressed: () {
              // Navigate to Profile
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Tuition Receipt',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 50, right: 50, top: 5, bottom: 10),
            decoration: BoxDecoration(color: Colors.grey.shade300),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(children: [
                  Container(
                    color: Colors.grey,
                    padding:
                        EdgeInsets.only(left: 5, right: 20, top: 5, bottom: 5),
                    child: Text(
                      "Receipt No            ",
                    ),
                  ),
                  SizedBox(
                    width: 350,
                  ),
                  Container(
                    color: Colors.grey,
                    padding:
                        EdgeInsets.only(left: 5, right: 20, top: 5, bottom: 5),
                    child: Text(
                      "Receipt No        ",
                    ),
                  ),
                  Spacer(),
                ]),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "___________________________________________________"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          " /مبلغ وقدره",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                            "___________________________________________________"),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "/وذالك قيمته",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(" تارخ الدفع"),
                        SizedBox(
                          width: 350,
                        ),
                        Text(
                          "تاريخ الاستحقاق",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "/دفعه",
                        ),
                        SizedBox(
                          width: 365,
                        ),
                        Text("/ اسم الطالب"),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "/المستوي",
                        ),
                        SizedBox(
                          width: 370,
                        ),
                        Text("/اسم الموظف"),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("توقيع الاداره الماليه"),
                              SizedBox(
                                height: 30,
                              ),
                              Text("____________________"),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Column(
                            children: [
                              Text("توقيع الاداره الماليه"),
                              SizedBox(
                                height: 30,
                              ),
                              Text("____________________"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("call  27272145/\n27272146"),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 50,
                width: 1,
                color: Colors.black,
              ),
              Text("info @mti.edu.eh"),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 50,
                width: 1,
                color: Colors.black,
              ),
              Text("https://www.mti.edu.eg"),
              Container(
                margin: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                height: 50,
                width: 1,
                color: Colors.black,
              ),
              Text("19041    HOTLINE"),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.blue,
                  child: Text(
                    "Confirm",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 100,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  color: Colors.blue,
                  child: Text(
                    "Print",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
