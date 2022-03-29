import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class dio extends StatefulWidget {
  const dio({ Key? key }) : super(key: key);

  @override
  State<dio> createState() => _dioState();
}

class _dioState extends State<dio> {
  String _response =' no data Avialibale';

  @override
   
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Dio'),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            alignment: Alignment.center,
            child: ElevatedButton(onPressed: (){httpRequest();
            
            }, child: Text('Sent HTTP Request'),),

          ),
          Expanded(child: SingleChildScrollView(child:Text(_response),))
        ],
      ),
      
    );
  }

Future httpRequest() async{
  try {
    var dio =Dio();
    var response = await  dio.post('https://jsonplaceholder.typicode.com/posts',
    data: {'userId':'007','title':'Dio Scootor','name':'Barath'
}
  );
 _response = response.data.toString();

 
 } catch (error){
    _response ='Error Occurred : $error';
  }finally{
    setState((){
_response;
    });
  }
  }
}


