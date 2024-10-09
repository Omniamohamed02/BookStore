import 'package:flutter/material.dart';
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(10.0),
      child: TextField(
         decoration: InputDecoration(
           filled: true,
           fillColor: Colors.white,
           contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(30.0),
             borderSide:const BorderSide(width: 0.8,color: Color(0xFF17212C)),
           ),
               hintText: 'Search for a Book',
           prefixIcon:const Icon(Icons.search,size: 30,color: Color(0xFF17212C),),
           suffixIcon: IconButton(onPressed: (){},
               icon:const Icon(Icons.clear,color: Color(0xFF17212C),))

         ),
      ),
    );
  }
}
