
import 'package:cgpa_converter/data_structure.dart';
import 'package:cgpa_converter/init.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Function resetState=(){};

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    Init.initialize();
    resetState=setstate;
    super.initState();
  }

  void setstate(){
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (light, dark) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: dark?.primary ?? Colors.white,
            appBar: AppBar(
              backgroundColor: dark?.primaryContainer ?? Colors.blueAccent,
              title: Text('CGPA Converter',
                  style: TextStyle(color: dark?.primary ?? Colors.black)),
            ),
            body: Column(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: dark?.primaryContainer ?? Colors.blueAccent,
                    border: Border(
                        top: BorderSide(
                          color: dark?.primary.withAlpha(100)??Colors.white24,
                          style: BorderStyle.solid,
                          width: 2,
                        )
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        child: Container(

                          padding: const EdgeInsets.all(12),
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: dark?.primary??Colors.white70,
                            borderRadius: BorderRadius.circular(12)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total Courses',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: dark?.primaryContainer??Colors.black)),
                                  const SizedBox(width: 12),
                                  Text('$totalCourses',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: dark?.primaryContainer??Colors.black)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('CGPA',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: dark?.primaryContainer??Colors.black)),
                                  const SizedBox(width: 12,),
                                  Text('$cgpa',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: dark?.primaryContainer??Colors.black))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 155,
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1000)),
                              color: dark?.primary??Colors.white70,
                              textColor: dark?.primaryContainer??Colors.black,
                              onPressed: () {
                                TextEditingController courseName = TextEditingController();
                                TextEditingController credits = TextEditingController();
                                TextEditingController grades = TextEditingController();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context)=>Dialog.fullscreen(
                                      backgroundColor: dark?.primary??Colors.white70,
                                      child: Scaffold(
                                        backgroundColor: dark?.primary??Colors.white70,
                                        appBar: AppBar(
                                          backgroundColor: dark?.primaryContainer ?? Colors.blueAccent,
                                          foregroundColor: dark?.primary ?? Colors.black,
                                          title: const Text('Add Course'),
                                        ),
                                        body: SingleChildScrollView(
                                          padding: const EdgeInsets.all(24),
                                          child: Column(
                                            children: [
                                              Container(
                                                child: TextField(
                                                  controller: courseName,
                                                  style: TextStyle(
                                                      color: dark?.primaryContainer??Colors.black
                                                  ),

                                                  decoration: InputDecoration(
                                                    border: const OutlineInputBorder(),
                                                    labelText: 'Course name',
                                                    labelStyle: TextStyle(
                                                      color: dark?.primaryContainer??Colors.black
                                                    )
                                                  ),

                                                ),
                                              ),
                                              Container(height: 20,),
                                              Container(
                                                child: TextField(
                                                  controller: credits,
                                                  style: TextStyle(
                                                      color: dark?.primaryContainer??Colors.black
                                                  ),

                                                  decoration: InputDecoration(
                                                      border: const OutlineInputBorder(),
                                                      labelText: 'Credits',
                                                      labelStyle: TextStyle(
                                                          color: dark?.primaryContainer??Colors.black
                                                      )
                                                  ),

                                                ),
                                              ),
                                              Container(height: 20,),
                                              Container(
                                                child: TextField(
                                                  controller: grades,
                                                  style: TextStyle(
                                                      color: dark?.primaryContainer??Colors.black
                                                  ),
                                                  decoration: InputDecoration(
                                                      border: const OutlineInputBorder(),
                                                      labelText: 'Grades',
                                                      labelStyle: TextStyle(
                                                          color: dark?.primaryContainer??Colors.black
                                                      )
                                                  ),

                                                ),
                                              ),
                                              Container(height: 20,),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor: MaterialStatePropertyAll(
                                                      dark?.primary??Colors.white70
                                                    ),
                                                    backgroundColor: MaterialStatePropertyAll(
                                                        dark?.primaryContainer??Colors.blueAccent,
                                                    )
                                                  ),
                                                  onPressed: () {
                                                    if(courseName.text.isEmpty||credits.text.isEmpty||grades.text.isEmpty){
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            backgroundColor: Colors.red.withAlpha(140),
                                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                                            content: const Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text('Please fill all details!',style: TextStyle(
                                                                    color: Colors.black
                                                                ),)
                                                              ],
                                                            ),
                                                          )
                                                      );
                                                      return;
                                                    }
                                                    try {
                                                      if(!isValidAlpha(grades.text)){
                                                        ScaffoldMessenger.of(context).showSnackBar(
                                                            SnackBar(
                                                              backgroundColor:  Colors.red.withAlpha(140),
                                                              padding: const EdgeInsets.symmetric(vertical: 12),
                                                              content: const Row(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Text('Grade can have values (S,A,B,C,D,E,F)',style: TextStyle(
                                                                      color: Colors.black
                                                                  ),)
                                                                ],
                                                              ),
                                                            )
                                                        );
                                                        return;
                                                      }
                                                      addCourse(Course(courseName.text, int.parse(credits.text), grades.text))
                                                          .then((result) => {
                                                        if(result==true){
                                                          setState(() {
                                                            resetState();
                                                          }),
                                                          Navigator.pop(context)
                                                        }else{
                                                          ScaffoldMessenger.of(context).showSnackBar(
                                                              SnackBar(
                                                                backgroundColor: Colors.red.withAlpha(140),
                                                                padding: const EdgeInsets.symmetric(vertical: 12),
                                                                content: const Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Text('Course Already Added!',style: TextStyle(
                                                                      color: Colors.black
                                                                    ),)
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                        }
                                                      });
                                                    } catch(e){
                                                      ScaffoldMessenger.of(context).showSnackBar(
                                                          SnackBar(
                                                            backgroundColor:  Colors.red.withAlpha(140),
                                                            padding: const EdgeInsets.symmetric(vertical: 12),
                                                            content: const Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text('Credits is a Numeric value',style: TextStyle(
                                                                    color: Colors.black
                                                                ),)
                                                              ],
                                                            ),
                                                          )
                                                      );
                                                      return;
                                                    }
                                                  },
                                                  child: const Text('Add'),
                                                )
                                              ),
                                              Container(height: 20,),
                                            ],
                                          ),
                                        ),

                                      ),
                                    )
                                );
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add),
                                  Text('Add Course')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height-200,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 24),
                    child: CourseListView(light, dark),
                  ),
                ),
              ],
            )
          );
        }
    );
  }
}


class CourseWidget extends StatefulWidget {
  final Course object;
  final ColorScheme? light;
  final ColorScheme? dark;
  final Function callback;

  const CourseWidget(this.light, this.dark, this.callback, {super.key, required this.object});


  @override
  State<CourseWidget> createState() => _CourseState(light, dark);
}

class _CourseState extends State<CourseWidget> {
  final ColorScheme? light;
  final ColorScheme? dark;

  @override
  _CourseState(this.light, this.dark);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: light?.primary??Colors.lightBlueAccent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 12),
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.object.name,style: TextStyle(
                    color: dark?.primary,
                    fontSize: 24,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 90,
                        child: Text('Credits ${widget.object.credits.toString()}',style: TextStyle(
                          color: dark?.primary,
                          fontSize: 16,
                        )),
                      ),
                      SizedBox(
                        width: 90,
                        child: Text('Grades ${widget.object.grades.toString()}',style: TextStyle(
                          color: dark?.primary,
                          fontSize: 16,
                        )),
                      ),
                    ],
                  )
                ],
              ),
              Expanded(child: Container()),
              Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          deleteCourse(widget.object.name).then((value) => {
                            widget.callback(),
                            resetState(),
                          });
                        },
                        icon: Icon(Icons.delete,color: dark?.primary??Colors.white70),
                      ),
                      IconButton(
                        onPressed: () {
                          TextEditingController courseName = TextEditingController(text: widget.object.name);
                          TextEditingController credits = TextEditingController(text: widget.object.credits.toString());
                          TextEditingController grades = TextEditingController(text: widget.object.grades);
                          showDialog(
                              context: context,
                              builder: (BuildContext context)=>Dialog.fullscreen(
                                insetAnimationCurve: Curves.linear,
                                backgroundColor: dark?.primary??Colors.white70,
                                child: Scaffold(
                                  backgroundColor: dark?.primary??Colors.white70,
                                  appBar: AppBar(
                                    backgroundColor: dark?.primaryContainer ?? Colors.blueAccent,
                                    foregroundColor: dark?.primary ?? Colors.black,
                                    title: const Text('Edit Course'),
                                  ),
                                  body: SingleChildScrollView(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      children: [
                                        Container(
                                          child: TextField(
                                            controller: courseName,
                                            style: TextStyle(
                                                color: dark?.primaryContainer??Colors.black
                                            ),

                                            decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText: 'Course name',
                                                labelStyle: TextStyle(
                                                    color: dark?.primaryContainer??Colors.black
                                                )
                                            ),

                                          ),
                                        ),
                                        Container(height: 20,),
                                        Container(
                                          child: TextField(
                                            controller: credits,
                                            style: TextStyle(
                                                color: dark?.primaryContainer??Colors.black
                                            ),

                                            decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText: 'Credits',
                                                labelStyle: TextStyle(
                                                    color: dark?.primaryContainer??Colors.black
                                                )
                                            ),

                                          ),
                                        ),
                                        Container(height: 20,),
                                        Container(
                                          child: TextField(
                                            controller: grades,
                                            style: TextStyle(
                                                color: dark?.primaryContainer??Colors.black
                                            ),
                                            decoration: InputDecoration(
                                                border: const OutlineInputBorder(),
                                                labelText: 'Grades',
                                                labelStyle: TextStyle(
                                                    color: dark?.primaryContainer??Colors.black
                                                )
                                            ),

                                          ),
                                        ),
                                        Container(height: 20,),
                                        SizedBox(
                                            width: double.infinity,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                  foregroundColor: MaterialStatePropertyAll(
                                                      dark?.primary??Colors.white70
                                                  ),
                                                  backgroundColor: MaterialStatePropertyAll(
                                                    dark?.primaryContainer??Colors.blueAccent,
                                                  )
                                              ),
                                              onPressed: () {
                                                if(courseName.text.isEmpty||credits.text.isEmpty||grades.text.isEmpty){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        backgroundColor: Colors.red.withAlpha(140),
                                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                                        content: const Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text('Please fill all details!',style: TextStyle(
                                                                color: Colors.black
                                                            ),)
                                                          ],
                                                        ),
                                                      )
                                                  );
                                                  return;
                                                }
                                                try {

                                                  if(!isValidAlpha(grades.text)){
                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                        SnackBar(
                                                          backgroundColor:  Colors.red.withAlpha(140),
                                                          padding: const EdgeInsets.symmetric(vertical: 12),
                                                          content: const Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              Text('Grade can have values (S,A,B,C,D,E,F)',style: TextStyle(
                                                                  color: Colors.black
                                                              ),)
                                                            ],
                                                          ),
                                                        )
                                                    );
                                                    return;
                                                  }
                                                  editCourse(Course(courseName.text, int.parse(credits.text), grades.text), widget.object.name)
                                                      .then((result) => {
                                                    if(result==true){
                                                      setState(() {
                                                        resetState();
                                                      }),
                                                      Navigator.pop(context)
                                                    }
                                                  });
                                                } catch(e){
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                      SnackBar(
                                                        backgroundColor:  Colors.red.withAlpha(140),
                                                        padding: const EdgeInsets.symmetric(vertical: 12),
                                                        content: const Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text('Credits is a Numeric value!',style: TextStyle(
                                                                color: Colors.black
                                                            ),)
                                                          ],
                                                        ),
                                                      )
                                                  );
                                                  return;
                                                }
                                              },
                                              child: const Text('Save'),
                                            )
                                        ),
                                        Container(height: 20,),
                                      ],
                                    ),
                                  ),

                                ),
                              )
                          );
                        },
                        icon: Icon(Icons.edit,color: dark?.primary??Colors.white70),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 16,)
      ],
    );
  }
}


class CourseListView extends StatefulWidget {
  final ColorScheme? light;
  final ColorScheme? dark;

  const CourseListView( this.light, this.dark, {super.key});


  @override
  State<CourseListView> createState() => _CourseListViewState();
}

class _CourseListViewState extends State<CourseListView> {
  void callback(){
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(String course in courses) CourseWidget(widget.light, widget.dark, object: courseMap[course]!, callback)
      ],
    );
  }
}
