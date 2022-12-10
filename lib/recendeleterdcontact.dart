import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcontact/providerclass.dart';

class Recndileted extends StatefulWidget {
  const Recndileted({Key? key}) : super(key: key);

  @override
  State<Recndileted> createState() => _RecndiletedState();
}

class _RecndiletedState extends State<Recndileted> {


  @override
  Widget build(BuildContext context) {
    var deletedcard=context.watch<ContactProvider>().Deletedcard;
    return Scaffold(
      appBar: AppBar(title: Text('Recndeletd'),),
      body:  ListView.builder(itemBuilder: (context, index) {

        var newdeletedcard=deletedcard[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text(
              newdeletedcard.name[0].toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              newdeletedcard.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              newdeletedcard.number,
              style: TextStyle(color: Colors.purple),
            ),
            trailing: IconButton(
                onPressed: () {

                },
                icon: Icon(Icons.backspace)),
          ),
        );
      },itemCount: deletedcard.length,),
    );
  }
}
