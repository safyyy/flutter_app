import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border: TableBorder.all(),
          columnWidths: const <int, TableColumnWidth>{
            2: FixedColumnWidth(100),
          },
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(children: [
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text(
                      'Action',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),  
            ]
            ),
            TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Text(
                      'Sonam',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ),
                  TableCell(
                  child: Center(
                    child: Text(
                      'Sonam@gmail.com',
                      style: TextStyle(fontSize: 18.0
                      ),
                    ),
                  ),
                ),
               TableCell(
                  child: Row(
                  children: [
                    
                  ],
                  ),
                ),
                
              ]
            )
          ],
        ),
      ),
    );
  }
}
