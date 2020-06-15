import 'package:flutter/material.dart';
import 'package:budikdamber/theme.dart';

class CollapseListItem extends StatefulWidget {
  final String title;
  final bool isSelected;
  final Function onTap;

  CollapseListItem({@required this.title, this.isSelected, this.onTap});

  @override
  _CollapseListItemState createState() => _CollapseListItemState();
}

class _CollapseListItemState extends State<CollapseListItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              style: widget.isSelected
                  ? ListTileSelectedItem
                  : ListTileDefaultText,
            ),
            SizedBox(
              height: 16.0,
            )
          ],
        ),
      ),
    );
  }
}
