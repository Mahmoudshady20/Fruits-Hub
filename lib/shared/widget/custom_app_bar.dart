import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key,required this.title,});
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: Theme.of(context).textTheme.titleMedium,),

      backgroundColor: Colors.white,
      centerTitle: true,
      leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios,)),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
