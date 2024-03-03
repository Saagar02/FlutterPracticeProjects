
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class BottomSheet1 extends StatefulWidget {
  const BottomSheet1({super.key});

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet1> {
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2015, 1, 1),
      lastDate: DateTime(2100, 12, 31),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
      ),
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(onPressed: ()=>(
            showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                  builder: (BuildContext context){
                    return Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        height: 363,
                        width: 360,  
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)
                          )
                        ),
                        child:Padding(
                          padding:const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(height: 13,),
                              const Text("Create Task",
                                      style: TextStyle(fontSize: 22,
                                      fontWeight: FontWeight.w500),
                                    ),
                              Column(
                                children: [
                                  const Align(alignment: Alignment.topLeft,child: Text("Title",style: TextStyle(color: Color(0xFF02A7B1),))),
                                  Container(
                                    height: 40,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xFF02A7B1),
                                            width: 1,
                                          )
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Color(0xFF02A7B1),
                                            width: 1,
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Column(
                                children: [
                                  const Align(alignment: Alignment.topLeft,child: Text("Description",style: TextStyle(color: Color(0xFF02A7B1),))),
                                  Container(
                                    height: 72,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF02A7B1)
                                      ),
                                      borderRadius:const  BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const TextField(
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10,),
                              Column(
                                children: [
                                  const Align(alignment: Alignment.topLeft,child: Text("Date",style: TextStyle(color: Color(0xFF02A7B1),))),
                                  Container(
                                    height: 40,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF02A7B1),
                                      ),
                                      borderRadius: BorderRadius.circular(10)
                                    ),
                                    child:  Row(
                                    children: [
                                      Text(
                                        selectedDate != null
                                            ? DateFormat('dd/MM/yy').format(selectedDate!)
                                            : '',
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.calendar_month),
                                        onPressed: () => {setState(() => _selectDate(context),),} 
                                      ),
                                    ],
                                  ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  const Align(alignment: Alignment.topLeft,child: Text("Description",style: TextStyle(color: Color(0xFF02A7B1),))),
                                  Container(
                                    height: 72,
                                    width: 330,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(0xFF02A7B1)
                                      ),
                                      borderRadius:const  BorderRadius.all(Radius.circular(10))
                                    ),
                                    child: const TextField(
                                      maxLines: 5,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                                        focusedBorder: InputBorder.none,
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20,),
                              Container(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: ()=>(), 
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                                  ),
                                  child: const Text("Submit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                )
          ), child: const Icon(Icons.add)),
        ),
      ),
    );
  }
}