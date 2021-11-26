import 'package:breakingapp/utils/brecolor.dart';
import 'package:flutter/material.dart';

class WidgetSearch extends StatelessWidget {
  WidgetSearch({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Icon(Icons.manage_search_rounded, color: BreColor.colorBrownDark, size: 40),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  controller: _controller,
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.grey),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
