import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // For FontAwesome Icons
import 'package:todolist/todo_model_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isBVisible = true;
  bool _isImportant = false;
  final bool _isCompleted = false;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  Color? _selectedColor;

  static List<ToDoModelClass> todoList = [
  ToDoModelClass(
    title: "Take notes",
    description: "Take notes of every app you write ",
    date: "10 July 2023",
    time: "12:30",
    category: "Personal",
    selectedColor: Colors.yellow.shade200,
    isImportant : true,
    isCompleted: false,
  ),

  ToDoModelClass(
    title: "Arrange Meeting ",
    description: "Meet the backend team ",
    date: "10 July 2023",
    time: "12:30",
    category: "Work",
    selectedColor: Colors.green.shade200,
    isImportant: false,
    isCompleted: false,
  ),
];

  void submitButton(bool isEdit , [ToDoModelClass? todoObj]){
    if(_titleController.text.trim().isNotEmpty && _descriptionController.text.isNotEmpty && _dateController.text.isNotEmpty && _timeController.text.isNotEmpty){
      if(!isEdit){
        setState(() {
          todoList.add(
            ToDoModelClass(
              title: _titleController.text.trim(), 
              description: _descriptionController.text.trim(), 
              date: _dateController.text.trim(),
              time : _timeController.text.trim(),
              category: _categoryController.text.trim(),
              selectedColor: _selectedColor!,
              isImportant: _isImportant,
              isCompleted: _isCompleted,   
            )
          );
        });
      }else{
        setState(() {
          todoObj!.title = _titleController.text.trim();
          todoObj.description = _descriptionController.text.trim();
          todoObj.date = _dateController.text.trim();
          todoObj.time = _timeController.text.trim();
          todoObj.category = _categoryController.text.trim();
          todoObj.selectedColor = _selectedColor!;
          todoObj.isImportant = _isImportant;
        });
      }
    }
    clearController();
  }

  void clearController(){
    _titleController.clear();
    _descriptionController.clear();
    _dateController.clear();
    _timeController.clear();
    _categoryController.clear();
  }
  
  void deletToDo(ToDoModelClass toDoObj){
    setState(() {
      todoList.remove(toDoObj);
    });
  }

  void editToDo(ToDoModelClass todoObj){
    _titleController.text = todoObj.title;
    _descriptionController.text = todoObj.description;
    _dateController.text = todoObj.date;
    _timeController.text = todoObj.time;
    _selectedColor = todoObj.selectedColor;
    _categoryController.text = todoObj.category;
    showbottomSheet(true,todoObj);
  }
  
  Widget buildCircle() {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.red.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.blue.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.yellow.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => setState(() {
            _selectedColor =Colors.green.shade200;
          }),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
              border: Border.all(color: Colors.black,width: 2)
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
  
  void showbottomSheet(bool isEdit , [ToDoModelClass? todoObj]){
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
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
            height: 500,
            width: 360,  
            decoration:const  BoxDecoration(
              color:Colors.white ,
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
                  const SizedBox(height: 10,),
                  const Text("Create Task",
                          style: TextStyle(
                            color: Color.fromARGB(255, 56, 81, 194),
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Title",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextField(
                          controller: _titleController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF667EEA),//Color(0xFF02A7B1),
                                width: 1,
                              )
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Color(0xFF667EEA),
                                width: 1,
                              )
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Description",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 60,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child: TextField(
                          controller: _descriptionController,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  /* const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        const Text("Not Important",
                          style: TextStyle(
                            color: Color(0xFF667EEA),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = !_isImportant;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                            ),
                            child: _isImportant
                                ? const Icon(Icons.check, size: 20, color: Colors.red)
                                : null,
                          ),
                        ),
                        const SizedBox(width: 50,),
                        const Text("Important",
                          style: TextStyle(
                            color: Color(0xFF667EEA),
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        const SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isImportant = !_isImportant;
                            });
                          },
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: _isImportant ? Colors.blue : Colors.grey),
                            ),
                            child: _isImportant
                                ? null
                                : const Icon(Icons.check, size: 20, color: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  */
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(alignment: Alignment.topLeft,child: Text("Date",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                          Container(
                            height: 40,
                            width: 155,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: _dateController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 14.0,fontWeight: FontWeight.w500,color: Colors.black),
                              decoration:const InputDecoration(
                                contentPadding: EdgeInsets.all(4),
                                hintText: "dd/mm/yy",
                                suffixIcon: Icon(FontAwesomeIcons.calendarAlt,color: Colors.grey,),
                                border: InputBorder.none
                              ),
                              onTap:()async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2100,12,31),
                                );
                                String formattedDate = DateFormat.yMMMd().format(pickedDate!);
                                setState(() {
                                  _dateController.text = formattedDate;
                                });
                              }
                            )
                          ),
                        ],
                      ),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Align(alignment: Alignment.topLeft,child: Text("Time",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                          Container(
                            height: 40,
                            width: 155,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFF667EEA),//const Color(0xFF02A7B1),
                              ),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: TextField(
                              readOnly: true,
                              controller: _timeController,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 15.0,fontWeight: FontWeight.w500,color: Colors.black),
                              decoration:const InputDecoration(
                                contentPadding:EdgeInsets.all(5),
                                hintText: "hh/mm",
                                suffixIcon:Icon(FontAwesomeIcons.clock,color: Colors.grey,),
                                border: InputBorder.none
                              ),
                              onTap:()async {
                                TimeOfDay? pickedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );
                                String formattedTime = "${pickedTime!.hour}:${pickedTime.minute}";
                                setState(() {
                                  _timeController.text = formattedTime;
                                });
                              }
                            )
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Category",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),
                      const SizedBox(height: 2,),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child:Row(
                          children: [
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Personal";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.person_2_outlined , color : _categoryController.text == "Personal" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Personal",style: TextStyle(color: _categoryController.text == "Personal" 
                                    ? const Color(0xFF667EEA) : Colors.grey, fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Home";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.house_outlined,color : _categoryController.text == "Home" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Home",style: TextStyle(color: _categoryController.text == "Home" 
                                    ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                _categoryController.text = "Work";
                              },
                              child:Row(
                                children: [
                                  Icon(Icons.work_history_outlined ,
                                    color : _categoryController.text == "Work" 
                                    ? const Color(0xFF667EEA) : Colors.grey),
                                  const SizedBox(width: 2,),
                                  Text("Work",style: TextStyle(color: _categoryController.text == "Work" 
                                    ? const Color(0xFF667EEA) : Colors.grey,fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Column(
                    children: [
                      const Align(alignment: Alignment.topLeft,child: Text("Color",style: TextStyle(color: Color(0xFF667EEA),fontWeight: FontWeight.w500))),//Color(0xFF02A7B1),))),
                      Container(
                        height: 40,
                        width: 330,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFF667EEA),//const Color(0xFF02A7B1)
                          ),
                          borderRadius:const  BorderRadius.all(Radius.circular(10))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: buildCircle()
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        width: 150,
                        decoration:BoxDecoration(
                          gradient:const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                            Color(0xFF667EEA), 
                            Color(0xFF794BCB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: ()=>(
                            setState(() {
                              clearController();
                              Navigator.of(context).pop();
                            },)
                          ), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text("Cancel",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        height: 50,
                        width: 150,
                        decoration:BoxDecoration(
                          gradient:const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                            Color(0xFF667EEA), 
                            Color(0xFF794BCB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: ElevatedButton(
                          onPressed: ()=>(
                            setState(() {
                              isEdit ? submitButton(isEdit,todoObj) : submitButton(isEdit);
                              Navigator.of(context).pop();
                            },)
                          ), 
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,//MaterialStateProperty.all<Color>(const Colors.transparent)//MaterialStateProperty.all<Color>(const Color(0xFF02A7B1))
                            foregroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text("Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
    );
  }
  
  Widget todos(int index){
    Image image ;
    if(todoList[index].category == 'Work'){
      image = Image.asset("images/work.png");
    }else if(todoList[index].category == 'Home'){
      image = Image.asset("images/home.png");
    }else{
      image = Image.asset("images/personal.png");
    }
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: todoList[index].selectedColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 10),
              color: Color.fromRGBO(0, 0, 0, 0.1),
              blurRadius: 10,
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 10 , left: 10 , top: 5 , bottom: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: image
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              todoList[index].title,
                              maxLines: null,
                              style:TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                                decoration: todoList[index].isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                              ),
                            ),
                            const Spacer(),
                            Checkbox(
                              value: todoList[index].isCompleted, 
                              onChanged: (bool ? value){
                                setState(() {
                                  todoList[index].isCompleted = !todoList[index].isCompleted;
                                });
                              }
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          todoList[index].description,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromRGBO(84, 84, 84, 1),
                            decoration: todoList[index].isCompleted ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(
                color: Color.fromRGBO(72, 72, 72, 1), 
                thickness: 1.0,
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  children: [
                    Text(
                      todoList[index].date,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(72, 72, 72, 1),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      todoList[index].time,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(72, 72, 72, 1),
                      ),
                    ),
                    
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        todoList[index].isCompleted == false ? GestureDetector(
                          onTap: () {
                            editToDo(todoList[index]);
                          },
                          child: const Icon(
                            Icons.edit_outlined,
                            size: 28,
                            color: Color.fromRGBO(84, 84, 84, 1)//Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ) : const SizedBox.shrink(),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {
                            deletToDo(todoList[index]);
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            size: 28,
                            color: Color.fromRGBO(84, 84, 84, 1)//Color.fromRGBO(0, 139, 148, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const IconButton(onPressed: null, icon: Icon(Icons.menu,color: Colors.black,size: 30,)),
            const Text("To Do",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 22),),
            SizedBox(
              height: 40,
              width: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("images/PassPort.jpg"),
              ),
            ),
          ]
      ),
      flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF667EEA), 
                Color(0xFF794BCB)], 
              ),
            ),
          ),
        //backgroundColor: //Color.fromARGB(250, 153, 51, 255),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          if(notification.direction == ScrollDirection.reverse || notification.direction == ScrollDirection.forward){
            setState(() {
              _isBVisible = false;
            });
          }
          if(notification.direction == ScrollDirection.idle){
            setState(() {
              _isBVisible = true;
            });
          }
          return true;
        },
        child: Container(
          /*decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF667EEA), 
                Color(0xFF794BCB)], 
              ),
          ),*/
          child: todoList.isEmpty ? Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/Task Done png.png',height: 125,),
                const Text("All Tasks Completed",
                  style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25),
                ),
              ],
            )
          ): Padding(
              padding:const EdgeInsets.all(15),
              child:ListView.builder(
                itemBuilder: (context,index){
                  return todos(index);
                },
                itemCount: todoList.length,
              ),
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _isBVisible,
        child: Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding:const EdgeInsets.symmetric(vertical: 8 , horizontal: 10),
            child: FloatingActionButton(
              onPressed: () =>(
                showbottomSheet(false)
              ),
              backgroundColor: Color.fromARGB(255, 114, 138, 248),
              child: const Icon(Icons.add),            
            ),
          ),
        ),
      ), 
    );
  }
} 