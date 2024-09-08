import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.news18.com/ibnlive/uploads/2023/06/image-35-16865419613x2.jpg'))),
          ),
          const ListTile(
            title: Text("Restart Progress",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.restart_alt_sharp,size: 28,),
          ),
          const ListTile(
            title: Text("Share with friends",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.share,size: 28,),
          ),
          const ListTile(
            title: Text("Rate us",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.star,size: 28,),
          ),
          const ListTile(
            title: Text("Feedback",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.comment,size: 28,),
          ),
          const ListTile(
            title: Text("Privacy Policy",style: TextStyle(fontSize: 18),),
            leading: Icon(Icons.security,size: 28,),
          ),
          const Divider(indent: 20,endIndent: 20,thickness: 2,),
          const Text('Version: 1.0.0',style: TextStyle(fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
