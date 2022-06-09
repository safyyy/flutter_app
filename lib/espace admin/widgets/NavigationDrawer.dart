import 'package:citoyen/espace%20admin/Dash/admin_profile.dart';
import 'package:citoyen/espace%20admin/Dash/crud.dart';
import 'package:citoyen/espace%20admin/screens/Dashbord.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  late final Widget child;
//File ? image;
// Future getImage()async{

//   try{
//    // print(authUser);
//   //  print(authUser["avatar"]);
//     //var strimg = authUser["avatar"];
//     //print(strimg);
//     //image = Image.memory(base64Decode(authUser["avatar"])) as File?;
//     // final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//     // if (image==null)return;
//     // final imageTemp = File(image.path);
//     // setState(() {
//     //   this.image=imageTemp;
//     //   ConvertImage(imageTemp);
//     // });
//   }on PlatformException catch(e){
//     print('Failed to pick image:$e');
//   }
// }
//  Future getImage()async{

//   try{
//     final image = await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (image==null)return;
//     final imageTemp = File(image.path);
//     setState(()=>this.image=imageTemp);
//     // encode image to base64

//   }on PlatformException catch(e){
//     print('Failed to pick image:$e');
//   }
// }

  //convert photo file to string
// Future ConvertImage(File image) async{
//   Uint8List imageBytes = await image.readAsBytes();//convert to Bytes
//   String base64string = base64.encode(imageBytes);

//   print(base64string);

//   final response = await http.post(
//       Uri.parse("${myBaseURL}/setImage"),
//       headers: {
//         "Content-Type": "application/json",
//         'Authorization': 'Bearer '+authToken,
//       },
//       body: jsonEncode(<String, String>{
//       'avatar': base64string,
//     }),
//       );
//   }

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItem(context),
          ],
        )),
      );
  Widget buildHeader(BuildContext context) => Material(
        color: Colors.green[300],
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Dashbord()));
          },
          child: Container(
            padding: EdgeInsets.only(
              top: 24 + MediaQuery.of(context).padding.top,
              bottom: 24,
            ),
            child: Column(
              children: [
                // InkWell(
                //  onTap: () {
                //  getImage();

                //},

                //child:image== null? Container(
                // decoration:BoxDecoration(
                // borderRadius:BorderRadius.circular(50),
                //color: Colors.white,
                //border: Border.all(
                // color: Colors.grey
                // ) ),

                //width: 100,
                //height:100,
                //child: Icon(CupertinoIcons.camera, color: kPrimaryColor,
                //),
                //)
                //:Container(clipBehavior:Clip.antiAliasWithSaveLayer,
                //d//ecoration:BoxDecoration(
                //borderRadius:BorderRadius.circular(50),
                //color: Colors.white,
                //border: Border.all(
                //   color: Colors.grey
                // ) ,),

                //width: 100,
                // height: 100,
                //child: Image.file(image!,fit: BoxFit.cover),

                //),
                // ),

                SizedBox(
                  height: 12,
                ),
                Text('Admin Space',
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItem(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16.0,
          children: [
            ListTile(
              hoverColor: Color.fromARGB(255, 157, 240, 146),
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Dashbord()),
                );
              },
            ),
            ListTile(
              hoverColor: Color.fromARGB(255, 157, 240, 146),
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminProfile()),
                );
              },
            ),
/*            ListTile(
              hoverColor: Color.fromARGB(255, 157, 240, 146),
              leading: const Icon(Icons.message_outlined),
              title: const Text('Message '),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Message()),
                );
              },
            ),*/
            ListTile(
              hoverColor: Color.fromARGB(255, 157, 240, 146),
              leading: const Icon(Icons.person),
              title: const Text('Citizens'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Crud()),
                );
              },
            ),
            const Divider(
              color: Colors.black,
            ),
            ListTile(
              hoverColor: Color.fromARGB(255, 157, 240, 146),
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      );
}
