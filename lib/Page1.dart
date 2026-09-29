
import 'package:flutter/material.dart';

class Page1 extends StatelessWidget{
  const Page1({super.key});
  @override
  Widget build(BuildContext context){
    return  Scaffold
      (
        body:SafeArea(
            child: Center(child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("This is Text"),
              SizedBox(height: 12,),
              Text("here we Have Styling",style:TextStyle(
                fontWeight: FontWeight.bold
              )),
              SizedBox(height: 12,),
              Text("this text is Italic",style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 44
              ),),
              SizedBox(height: 12,),
              Text("Button Sections"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(onPressed: (){}, child: Text("Elevated button")),
                    FilledButton(onPressed: (){}, child: Text("FilledButton")),
                    OutlinedButton(onPressed: (){}, child: Text("OutlineButton")),
                    IconButton(onPressed: (){},icon:Icon(Icons.add),),
                    TextButton(onPressed: (){}, child: Text("Text Button"))
                  ],
                )
                
            ],))
        )
    );
  }

}