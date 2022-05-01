import 'package:flutter/material.dart';

class registration2 extends StatefulWidget {


  @override
  State<registration2> createState() => _registration2State();
}

class _registration2State extends State<registration2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 100, 30, 0),
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "LUMOS",
                            style: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.height * 0.05,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Vector.png",
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: BoxShape.rectangle,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage(
                          "assets/images/Frame.png",
                        ),
                        fit: BoxFit.fitHeight),
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
              child: Text(
                "Create Password",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
              child: Text(
                "Step 2/2",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 8, 3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.080,
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.lightBlue,
                      width: 2,
                      style: BorderStyle.solid,
                    )),
                child: Row(
                  children: [
                    Container(
                      width: 320,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 15,
                            ),
                            labelText: "Registration number",
                            border: InputBorder.none,
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 3),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.080,
                width: MediaQuery.of(context).size.width * 0.90,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 15,
                            ),
                            fillColor: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.080,
                width: MediaQuery.of(context).size.width * 0.90,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.lightBlue,
                    width: 2,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.075,
                      child: const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(
                              color: Colors.lightBlue,
                              fontSize: 15,
                            ),
                            fillColor: Colors.white,
                          ),
                          cursorColor: Colors.white,
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(90, 10, 8, 0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.075,
                width: MediaQuery.of(context).size.width * 0.50,
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue,
                ),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
                      height: MediaQuery.of(context).size.height * 0.60,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextButton(
                            onPressed: null, child: Icon(Icons.check)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

