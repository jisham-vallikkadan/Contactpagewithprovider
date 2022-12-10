import 'package:flutter/material.dart';

import 'contactcardmodel.dart';

class ContactProvider with ChangeNotifier{

final List<ContactCard> _Ccard=<ContactCard>[];

List<ContactCard> get Ccard=>_Ccard;


 final List<ContactCard> _Deletedcard=<ContactCard> [];
 List<ContactCard> get Deletedcard=>_Deletedcard;

void addcontact(ContactCard contactCard){
  _Ccard.add(contactCard);
  notifyListeners();

}
 void deletecontact(ContactCard contactCard){
  _Ccard.remove(contactCard);
  notifyListeners();
 }


  void addtorecndelet(ContactCard contactCard){
  _Deletedcard.add(contactCard);
  notifyListeners();
  }



}