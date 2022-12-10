import 'package:flutter/material.dart';

class Contactwithoutprovider extends StatefulWidget {
  const Contactwithoutprovider({Key? key}) : super(key: key);

  @override
  State<Contactwithoutprovider> createState() => _ContactwithoutproviderState();
}

class _ContactwithoutproviderState extends State<Contactwithoutprovider> {
  TextEditingController namecotroler = TextEditingController();
  TextEditingController numbercontroler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              contact.removeLast();
            });
          }, icon: Icon(Icons.clear))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: namecotroler,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: numbercontroler,
                decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Phone number'),
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: (){

                    setState(() {
                      if(namecotroler.text.isEmpty||numbercontroler.text.isEmpty){

                      }else {
                        contact.add(Contactcard(name: namecotroler.text, number: numbercontroler.text));
                      }
                      numbercontroler.text='';
                      namecotroler.text='';
                    });
                }
                ,splashColor: Colors.grey,
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue,
                  ),
                  width: MediaQuery.of(context).size.width / 2,
                  height: 50,

                  child: Center(
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: ListView.builder(itemBuilder: (context, index) => contactcad(C: contact[index] ),
                  itemCount: contact.length,
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget contactcad({
  required Contactcard C,
}) {
  return Card(
    child: ListTile(
      leading: CircleAvatar(backgroundColor: Colors.black,
        child: Text(C.name[0].toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      title: Text(
        C.name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(C.number,style: TextStyle(color: Colors.purple),),
      trailing: IconButton(onPressed: (){

      },icon: Icon(Icons.person)),
    ),
  );
}

class Contactcard {
  String name;
  String number;
  Contactcard({required this.name, required this.number});
}

List<Contactcard> contact = [];
