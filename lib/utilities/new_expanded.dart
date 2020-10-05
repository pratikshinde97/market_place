import 'package:flutter/material.dart';

class NewExpanded extends StatelessWidget {
  final Function onTap;
  final IconData iconData;
  final String tabName;
  final Color color;
  NewExpanded({this.iconData,this.onTap,this.tabName,this.color});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            children: <Widget>[
              Icon(iconData,color: color,),
              SizedBox(width: 4,),
              Text(tabName,style: TextStyle(fontSize: 12,color: color),)
            ],
          ),
        ),
      ),
    );
  }
}
