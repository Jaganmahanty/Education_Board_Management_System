import 'package:flutter/material.dart';
import 'package:flutter_application/universal_attribute.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class sign_up extends StatefulWidget {
  const sign_up({super.key});

  @override
  State<sign_up> createState() => _sign_upState();
}

// ignore: camel_case_types
class _sign_upState extends State<sign_up> {
  final _formKey = GlobalKey<FormState>();

  _sign_upState() {
    selectedcategory = categoryList[0];
    selectedreligion = religionList[0];
    selectedclass = classList[0];
    selecteddivision = divisionList[0];
    selectedbank = banknameList[0];
    selectedoccupation = occupationList[0];
  }
  DateTime selecteddate = DateTime.now();

  final religionList = [
    "Hinduism",
    "Islam",
    "Christianity",
    "Buddhism",
    "Sikhism",
    "jainism",
    "judaism",
    "other"
  ];
  String? selectedreligion = "";

  final categoryList = ["General", "EWS", "SEBC", "SC", "ST"];
  String? selectedcategory = "";

  final bloodGroupsList = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  String? selectedbBloodGroup = "A+";

  final classList = ["9", "10", "11", "12"];
  String? selectedclass = "";

  final divisionList = ["A", "B", "C", "D"];
  String? selecteddivision = "";

  final banknameList = [
    "State Bank of India",
    "HDFC Bank",
    "ICICI Bank",
    "Axis Bank",
    "Punjab National Bank",
    "Bank of Baroda",
    "Kotak Mahindra Bank",
    "Canara Bank",
    "Union Bank of India",
    "IndusInd Bank",
    "IDFC FIRST Bank",
    "Yes Bank",
    "Bank of India",
    "Central Bank of India",
    "Indian Bank",
    "UCO Bank",
    "Punjab & Sind Bank",
    "RBL Bank",
    "Federal Bank",
    "South Indian Bank",
    "IDBI Bank",
    "Karur Vysya Bank",
    "City Union Bank",
    "Bandhan Bank",
    "Jammu & Kashmir Bank",
    "Dhanlaxmi Bank"
  ];
  String? selectedbank = "";

  final occupationList = ["Private Sector", "Government servant", "Business"];
  String? selectedoccupation = "";

  bool? checkBoxListTile = false;

  List<String> genderList = ["Boy", "Girl", "Other"];
  String? genderRadio = "Boy";

  final TextEditingController studentnameController = TextEditingController();
  final TextEditingController fathernameController = TextEditingController();
  final TextEditingController mothernameController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();
  final TextEditingController birthplaceController = TextEditingController();
  final TextEditingController incomeController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController mobileno1Controller = TextEditingController();
  final TextEditingController mobileno2Controller = TextEditingController();
  final TextEditingController emmailController = TextEditingController();
  final TextEditingController rollnoController = TextEditingController();
  final TextEditingController grnoController = TextEditingController();
  final TextEditingController studentuidnoController = TextEditingController();
  final TextEditingController aadharnoController = TextEditingController();
  final TextEditingController ifscController = TextEditingController();
  final TextEditingController accountnoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text(
            "Student Registration",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100),
          ),
        ),
        body: Form(
            key: _formKey,
            child: SizedBox(
              width: double.maxFinite,
              child: Column(children: [
                Expanded(
                  child: Scrollbar(
                    thumbVisibility: true,
                    thickness: 5.0, // Thickness of the scrollbar thumb
                    radius: const Radius.circular(5),
                    // Rounded edges for the thumb
                    //thumbColor: Colors.deepPurpleAccent,// Thumb color
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            // Text(
                            //   "Register Yourself !",
                            //   textAlign: TextAlign.center,
                            //   style: Theme.of(context).textTheme.headlineSmall,
                            // ),
                            const SizedBox(height: 50),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: Image.asset(
                                        'assets/images/student_regestration.png',
                                        // width: 150, // Adjust size as needed
                                        // height: 150, // Adjust size as needed
                                        fit: BoxFit
                                            .cover, // Adjust fit as needed
                                      )),
                                ]),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 50),
                                const Text(
                                  "Personal Details",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.deepPurpleAccent),
                                ),
                                const SizedBox(
                                  height: 0,
                                ),
                                const Divider(
                                  thickness: 2,
                                  color: Colors.deepPurpleAccent,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.values.first,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.values.first,
                                  children: [
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter FullName of Student';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: studentnameController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person_2_rounded,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText:
                                            "Student Name as per school record",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: RadioListTile(
                                                activeColor:
                                                    Colors.deepPurpleAccent,
                                                tileColor:
                                                    Colors.deepPurple.shade50,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                title: const Text("Boy"),
                                                value: genderList[0],
                                                groupValue: genderRadio,
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderRadio = value;
                                                  });
                                                })),
                                        const SizedBox(width: 10),
                                        Expanded(
                                            child: RadioListTile(
                                                tileColor:
                                                    Colors.deepPurple.shade50,
                                                activeColor:
                                                    Colors.deepPurpleAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                title: const Text("Girl"),
                                                value: genderList[1],
                                                groupValue: genderRadio,
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderRadio = value;
                                                  });
                                                })),
                                        const SizedBox(width: 10),
                                        Expanded(
                                            child: RadioListTile(
                                                tileColor:
                                                    Colors.deepPurple.shade50,
                                                activeColor:
                                                    Colors.deepPurpleAccent,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                title: const Text("Other"),
                                                value: genderList[2],
                                                groupValue: genderRadio,
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                                onChanged: (value) {
                                                  setState(() {
                                                    genderRadio = value;
                                                  });
                                                }))
                                      ],
                                    ),
                                    const SizedBox(height: Asize.sizedbox25),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Father\'s name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: fathernameController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person_4,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Father's Name",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Mother\'s name';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: mothernameController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.person_4,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Mother's Name",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: DropdownButtonFormField(
                                            value: selectedreligion,
                                            items: religionList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedreligion =
                                                    val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Religion",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: DropdownButtonFormField(
                                            value: selectedcategory,
                                            items: categoryList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedcategory =
                                                    val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Category",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.7,
                                                  color: Colors.black),
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: CheckboxListTile(
                                              activeColor:
                                                  Colors.deepPurpleAccent,
                                              value: checkBoxListTile,
                                              title: const Text("Minority"),
                                              onChanged: (val) {
                                                setState(() {
                                                  checkBoxListTile = val;
                                                });
                                              },
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .leading,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: DropdownButtonFormField(
                                            value: selectedbBloodGroup,
                                            items: bloodGroupsList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedbBloodGroup =
                                                    val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Blood Group (op)",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      controller: birthdateController,
                                      expands: false,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter The Birthdate';
                                        } else {
                                          return null;
                                        }
                                      },
                                      decoration: const InputDecoration(
                                        labelText: "Date Of Birth",
                                        prefixIcon: Icon(
                                          Icons.calendar_month,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter place of birth';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: birthplaceController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.add_location_alt,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Place of Birth (City)",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: DropdownButtonFormField(
                                            value: selectedoccupation,
                                            items: occupationList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedoccupation =
                                                    val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText:
                                                    "Father's Occupation",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                        // ignore: prefer_const_constructors
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: incomeController,
                                            expands: false,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter Father\'s Income ';
                                              } else {
                                                return null;
                                              }
                                            },
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.currency_rupee,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              labelText:
                                                  "Father's yearly Income",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter full address';
                                        } else {
                                          return null;
                                        }
                                      },
                                      maxLines: 3,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      controller: addressController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.location_on,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Full Address",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter pincode number';
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length != 6) {
                                                return "Pincode should be 6 digit";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: pincodeController,
                                            expands: false,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.app_registration,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              labelText: "Pincode",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        Expanded(
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter city name';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: cityController,
                                            expands: false,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.add_location_alt,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              labelText: "City",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter parent\'s mobile number';
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length != 10) {
                                                return "Mobile no should be 10 digit";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: mobileno1Controller,
                                            expands: false,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.phone,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              labelText: "Mobile No. 1",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        Expanded(
                                          child: TextFormField(
                                            keyboardType: TextInputType.phone,
                                            controller: mobileno2Controller,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return null;
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length != 10) {
                                                return "Mobile No should be 10 digit";
                                              } else {
                                                return null;
                                              }
                                            },
                                            expands: false,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.phone,
                                                color: Colors.deepPurpleAccent,
                                              ),
                                              labelText: "Mobile No. 2 (OP)",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 25),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emmailController,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return null;
                                        }
                                        // Regular expression for validating an email address
                                        final emailRegex = RegExp(
                                            r'^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$');
                                        if (!emailRegex.hasMatch(value)) {
                                          return 'Enter valid email address';
                                        }
                                        return null; // Return null if the input is valid
                                      },
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Email address (op)",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const Text(
                                      "Academic Details",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: DropdownButtonFormField(
                                            value: selectedclass,
                                            items: classList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedclass = val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Class",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: DropdownButtonFormField(
                                            value: selecteddivision,
                                            items: divisionList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selecteddivision =
                                                    val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Division",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                        const SizedBox(width: 25),
                                        Expanded(
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter roll no.';
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: rollnoController,
                                            expands: false,
                                            decoration: const InputDecoration(
                                              labelText: "Roll No.",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter G.R.no.';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: grnoController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.app_registration,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "GR No.",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter student UID no.';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length != 18) {
                                          return "Student UID no should be 18 digit";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: studentuidnoController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.app_registration,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Student UID No.",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    const Text(
                                      "Additional Details",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurpleAccent),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(
                                      thickness: 2,
                                      color: Colors.deepPurpleAccent,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Aadhar card no.';
                                        }
                                        if (value.isNotEmpty &&
                                            value.length != 12) {
                                          return "Aadhar card no should be 12 digit";
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: aadharnoController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.app_registration,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Aadhar Card No.",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 222,
                                          child: DropdownButtonFormField(
                                            value: selectedbank,
                                            items: banknameList
                                                .map((e) => DropdownMenuItem(
                                                      value: e,
                                                      child: Text(e),
                                                    ))
                                                .toList(),
                                            onChanged: (val) {
                                              setState(() {
                                                selectedbank = val as String;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons
                                                  .arrow_drop_down_circle_outlined,
                                              color: Colors.deepPurpleAccent,
                                            ),
                                            decoration: const InputDecoration(
                                                labelText: "Name of Bank",
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                7)))),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: TextFormField(
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Enter IFSC code';
                                              }
                                              if (value.isNotEmpty &&
                                                  value.length != 11) {
                                                return "IFSC code should be 11 Character";
                                              } else {
                                                return null;
                                              }
                                            },
                                            controller: ifscController,
                                            expands: false,
                                            decoration: const InputDecoration(
                                              labelText: "IFSC code",
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(7))),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.phone,
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Enter Bank account no';
                                        } else {
                                          return null;
                                        }
                                      },
                                      controller: accountnoController,
                                      expands: false,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.app_registration,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        labelText: "Bank account No.",
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(7))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          FirebaseFirestore.instance
                              .collection("Student_Information")
                              .doc(studentuidnoController.text)
                              .set({
                            "Student_Name": studentnameController.text,
                            "Gender": genderRadio,
                            "Father's_Name": fathernameController.text,
                            "Mother's_Name": mothernameController.text,
                            "Religion": selectedreligion,
                            "Category": selectedcategory,
                            "Is_Minority": checkBoxListTile,
                            "Blood_Group": selectedbBloodGroup,
                            "Date_Of_Birth": birthdateController.text,
                            "Place_Of_Birth": birthplaceController.text,
                            "Father's_Occupation": selectedoccupation,
                            "Father's_Income": incomeController.text,
                            "Address": addressController.text,
                            "Pincode": pincodeController.text,
                            "Cith": cityController.text,
                            "Mobile_No_1": mobileno1Controller.text,
                            "Mobile_No_2": mobileno2Controller.text,
                            "Email_Address": emmailController.text,
                            "Class": selectedclass,
                            "Division": selecteddivision,
                            "Roll_No": rollnoController.text,
                            "GR_No": grnoController.text,
                            "Student_UID_No": studentuidnoController.text,
                            "Aadhar_Card_No": aadharnoController.text,
                            "Bank_Name": selectedbank,
                            "Bank_IFSC_Code": ifscController.text,
                            "Bank_Account_No": accountnoController.text,
                          });

                          Fluttertoast.showToast(
                              msg: "hogaya bhai ho gaya..!",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM_RIGHT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.white,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        // Text color
                        shadowColor: Colors.black, // Shadow color
                        elevation: 5, // Elevation of the button
                        shape: RoundedRectangleBorder(
                          // Shape of the button
                          borderRadius:
                              BorderRadius.circular(7), // Rounded corners
                        ),
                        // Padding inside button
                      ),
                      child: const Text(
                        "Submit",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ]),
            )));
  }
}
