 import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

Drawer drawer(BuildContext context) {
 // final getDynamicSliderData = Provider.of<ProductProvider>(context).getDynamicSliderData;
  return Drawer(
    child: SingleChildScrollView(
      child: Column(
        children: [
          DrawerHeader(
             padding: EdgeInsets.all(0),
              decoration: BoxDecoration(

              ),
            child: Center(child: CircularProgressIndicator(),)
          ),


          ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {}),


          ListTile(
              leading: Icon(Icons.person),
              title: Text('Account'),
              onTap: () {
             //   Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavigatiomBar(index: 3, indexchange: 3),));
              }),

          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
           //   Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavigatiomBar(index: 0, indexchange: 0),));

            },
          ),

          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavigatiomBar(index: 1, indexchange: 1),));
            }),


          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
           //   Navigator.push(context, MaterialPageRoute(builder: (context) => BootomNavigatiomBar(index: 2, indexchange: 2),));

            }),





          ListTile(
            leading: Icon(Icons.login),
            title:  GetStorage().read("UserProfile")==null?Text('Login'):Text('Logout'),
            onTap: () async {
            //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(getphone: ""),));
              GetStorage().write("Api_token", null);
              GetStorage().write("UserProfile", null);
            },
          ),
        ],
      ),
    ),
  );
}
