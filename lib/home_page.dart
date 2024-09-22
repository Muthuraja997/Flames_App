// import 'dart:core';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String yourName="";
  String loverName="";
  String ansewer(List<String>flames,length)
  {
    final forremove=length%flames.length;
    final local=[...flames];
    local.removeAt(forremove==0?flames.length-1:forremove-1);
    if(flames.length==1)
    {
      return flames.join('');
    }
    return ansewer(local, length);

  }
  void finding()
  {
    List<String> longestName=(yourName.length>loverName.length?yourName:loverName).toLowerCase().split("");
    List<String> smallestName=(yourName.length<loverName.length?yourName:loverName).toLowerCase().split("");
    final local=[...longestName];
    for(var i in local){
      if(smallestName.contains(i))
      {
        smallestName.remove(i);
        longestName.remove(i);
      }
    }
    List<String> flames=["Frients","Lovers","Admirers","Marriage","Enemies", "Secret Lovers"];
    final length=smallestName.length+longestName.length;
    String ans=ansewer(flames, length);
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Your relationship'),
          content: Text(ans),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flames"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Column(
        children: [
             Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                onChanged: (value) {
                  yourName=value;
                },
                decoration: const InputDecoration(border: OutlineInputBorder(),labelText: "Your Name"),
              ),
            ),
          
          Padding(
            padding: const EdgeInsets.all(20),
            child: Center(child: TextField(
              onChanged: (value) {
                loverName=value;
              },
              decoration: const InputDecoration(border: OutlineInputBorder(),labelText: "Your Lover Name"),
            )),
          ),
          TextButton.icon(onPressed:() {
            print("Hey Look here");
            finding();
          }, label: const Text("Find your love"))
        ],
      ),
    );
  }
}
