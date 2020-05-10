import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../strings.dart';

class SearchField extends StatefulWidget {
  final String hintText;
  final Function onSubmitted;
  final TextEditingController controller;
  final isValid;

  const SearchField(
      this.hintText, this.onSubmitted, this.controller, this.isValid);
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final GlobalKey _searchKey = GlobalKey(debugLabel: 'SearchField');
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: _searchKey,
      maxLength: 100,
      maxLines: 1,
      autofocus: false,
      controller: widget.controller,
      textAlign: TextAlign.start,
      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
      cursorColor: Colors.tealAccent,
      decoration: InputDecoration(
        counterText: '',
        fillColor: Colors.white,
        filled: true,
        errorText: (!widget.isValid) ? Strings.validationErrorText : null,
        contentPadding: EdgeInsets.all(0.0),
        hintText: widget.hintText,
        focusedBorder: _buildOutlineInputBorder(Colors.tealAccent),
        enabledBorder: _buildOutlineInputBorder(Colors.black),
        errorBorder: _buildOutlineInputBorder(Colors.red),
      ),
      onFieldSubmitted: (text) {
        widget.onSubmitted();
      },
      keyboardType: TextInputType.text,
    );
  }

  UnderlineInputBorder _buildOutlineInputBorder(Color borderColor) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: 0.8),
    );
  }
}
