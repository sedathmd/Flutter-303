import 'package:flutter/material.dart';

import '../../303/call_back_learn.dart';

class CallbackDropdown extends StatefulWidget {
  const CallbackDropdown({super.key, required this.onUserSelected});
//callback olayı alt satırdaki ile saglanır. Required veririz
  final void Function(CallbackUser user) onUserSelected;
  @override
  State<CallbackDropdown> createState() => _CallbackDropdownState();
}

class _CallbackDropdownState extends State<CallbackDropdown> {
  CallbackUser? _user;
  void _updateUser(CallbackUser? item) {
    setState(() {
      _user = item;
    });
    //_user bos degilse callback
    if (_user != null) {
      widget.onUserSelected.call(_user!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: _user,
        items: CallbackUser.dummyUsers().map((e) {
          return DropdownMenuItem(
              value: e,
              child:
                  Text(e.name, style: Theme.of(context).textTheme.headline3));
        }).toList(),
        onChanged: _updateUser);
  }
}
