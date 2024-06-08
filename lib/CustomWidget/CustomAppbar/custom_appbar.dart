 import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
 import '../../custom_const.dart';

class CustomAppbar extends StatefulWidget {
  const CustomAppbar({super.key,this.onPressed,this.onTap,this.onChanged});
  final VoidCallback? onPressed;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
   // final addToCart = Provider.of<AddToCartProvider>(context);
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
       // color: Colors.white,
        color: bootomNavigationbarBackgrountcolor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15)
        )
      ),
      child: AppBar(
      //  backgroundColor: Colors.white,
        backgroundColor: bootomNavigationbarBackgrountcolor,
        leading: Container(
          margin: EdgeInsets.only(left: 15,bottom: 8,top: 8),
          height: 40,
          width: 45,
         decoration: BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.circular(10),
           image: DecorationImage(image: AssetImage("$Seru_Test_logo"))
         ),
        ),

      
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
          //    Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavigatiomBar(index: 2, indexchange: 2),));
            },
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 18,
                  child: Icon(Icons.shopping_cart,color: Colors.grey,size: 25,),
                ),

                Positioned(
                   right: 6,
                   top: 5,
                   child: CircleAvatar(
                     backgroundColor: Colors.black87,
                     radius: 7,
                     child: Text("11",style: TextStyle(fontSize: 10,color: Colors.white),
                     ),
                   ),
                 ),
              ],
            ),
          ),
          SizedBox(width: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: InkWell(
                onTap: widget.onTap,
                child: CircleAvatar(
                  radius: 18,
                    backgroundColor: defaultBackgroundColor,
                    child: Center(
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Icon(Icons.person),
                        ),
                      ),
                    )),
            ),
          ),
        ],
      ),
    );
  }

}
