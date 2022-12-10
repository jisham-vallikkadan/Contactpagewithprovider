import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testcontact/providerclass.dart';
import 'package:testcontact/recendeleterdcontact.dart';

import 'contactcardmodel.dart';

class Contactusingprovider extends StatefulWidget {
  const Contactusingprovider({Key? key}) : super(key: key);

  @override
  State<Contactusingprovider> createState() => _ContactusingproviderState();
}

class _ContactusingproviderState extends State<Contactusingprovider> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numbercontrolelr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ccard = context.watch<ContactProvider>().Ccard;
    return Scaffold(
        appBar: AppBar(
          title: Text('Add new contact'),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Recndileted(),));
            }, icon: Icon(Icons.confirmation_num_sharp))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: namecontroller,
                keyboardType:TextInputType.text,
                decoration: InputDecoration(hintText: "Enter Name",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(10),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: numbercontrolelr,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(

                hintText: 'Enter phonenumber',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {
                    if (namecontroller.text.isEmpty ||
                        namecontroller.text.isEmpty) {
                      return null;
                    } else {
                      Provider.of<ContactProvider>(context, listen: false)
                          .addcontact(ContactCard(
                              name: namecontroller.text,
                              number: numbercontrolelr.text));
                      namecontroller.text = '';
                      numbercontrolelr.text = '';
                    }
                  },
                  child: Text(
                    'add',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var newccard = ccard[index];
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Text(
                            newccard.name[0].toUpperCase(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        title: Text(
                          newccard.name,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          newccard.number,
                          style: TextStyle(color: Colors.purple),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              Provider.of<ContactProvider>(context,listen: false).deletecontact(newccard);
                              Provider.of<ContactProvider>(context,listen:false).addtorecndelet(newccard);
                            },
                            icon: Icon(Icons.delete)),
                      ),
                    );
                  },
                  itemCount: context.watch<ContactProvider>().Ccard.length,
                ),
              ),
            ],
          ),
        ));
  }
}
