import 'package:explore/core/data/database.dart';
import 'package:explore/utils/sizeConfig.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore/core/models/animal.dart';

class Donate extends StatefulWidget {
  final int currentAnimalIndex;
  final VoidCallback secondScreen;
  Donate({@required this.currentAnimalIndex,this.secondScreen}):assert(currentAnimalIndex!=null);
  @override
  State<StatefulWidget> createState() {
   return _Donate();
  }
}

class _Donate extends State<Donate> {
  Animal _animal;
  @override
  void initState() {
    _animal = Database.animalData[widget.currentAnimalIndex];
    super.initState();
  }

  @override
  void didUpdateWidget(Donate oldWidget) {
    if (widget.currentAnimalIndex != oldWidget.currentAnimalIndex) {
      _animal = Database.animalData[widget.currentAnimalIndex];
    }
    super.didUpdateWidget(oldWidget);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        SizedBox(width: 10),
        IconButton(icon: Icon(Icons.clear,color: Color.fromRGBO(164, 164, 164, 1.0),), onPressed: ()=>widget.secondScreen()),
      ],
      centerTitle: false,backgroundColor: Colors.transparent,elevation: 0.0,
      title: Column(
        children:[
          SizedBox(height: 15),
          Row(
        children: <Widget>[
          Image.asset(_animal.donate.logo),
          SizedBox(width: 20),
          Text(_animal.donate.organization,style: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0),fontSize: 15))
          ],mainAxisAlignment: MainAxisAlignment.start)])
      ),
      body: Column(
        children: [
        SizedBox(height: 10),
        Padding(padding: EdgeInsets.only(left: 15),child:Text(_animal.donate.headline,style: TextStyle(color: Colors.black,fontSize: 20))),
        SizedBox(height: 20),
        Row(
          children: <Widget>[
            SizedBox(width: 10),
            CircleAvatar(backgroundColor: _animal.primaryColor,radius: 20,child: Icon(Icons.thumb_up,color: Colors.black,size: 20)),
            SizedBox(width: 10),
            Text("${_animal.donate.count}",style: TextStyle(color: Colors.black,fontSize: 17))
          ],mainAxisAlignment: MainAxisAlignment.start,
        ),
        SizedBox(height: 20),
          Expanded(
                child: Padding(
                  child:ListView(
                    children: _animal.donate.images.map((img) => Padding(padding: EdgeInsets.only(left: 10),child:Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),image: DecorationImage(image: AssetImage(img),fit: BoxFit.cover),color: Colors.transparent),
                          width: SizeConfig.blockSizeHorizontal*90,
                        ))).toList(),scrollDirection: Axis.horizontal,
                  ),padding: EdgeInsets.only(right: 10),),
              ),
          SizedBox(height: 20),
      Padding(padding: EdgeInsets.only(left: 10),child:Text("Fundraising Goal",style: TextStyle(color: Color.fromRGBO(164, 164, 164, 1.0),fontSize: 12))),
          SizedBox(height: 10),
      Padding(padding: EdgeInsets.only(left: 10,right: 10),child:Container(decoration: BoxDecoration(color: Color.fromRGBO(241, 241, 241, 1.0),borderRadius: BorderRadius.circular(20)),height: 8,width: double.infinity,padding: EdgeInsets.only(right: SizeConfig.blockSizeHorizontal*(100-_animal.donate.percentage)),
            child:Container(decoration: BoxDecoration(color: _animal.primaryColor,borderRadius: BorderRadius.circular(20))))),
          SizedBox(height: 10),
      Padding(padding: EdgeInsets.only(left: 10),child:RichText(text: TextSpan(text: "₦${_animal.donate.received}",style: TextStyle(color:Colors.black,fontSize: 18),children: [
            TextSpan(text:" of ₦${_animal.donate.target}",style: TextStyle(color: Colors.black,fontSize: 15)),
          ]),textAlign: TextAlign.left)),
          SizedBox(height: 15),
          SizedBox(height: 50,width: double.infinity,child: FlatButton(onPressed: (){}, child: Text("DONATE",style: TextStyle(color: Colors.white,fontSize: 17),textAlign: TextAlign.center),textColor: Colors.white,color: _animal.primaryColor),)
        ],crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }
  
}