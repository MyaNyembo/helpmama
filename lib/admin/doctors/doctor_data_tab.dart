import 'dart:js';

import 'package:flutter/material.dart';

import '../http_protocol.dart';
import 'data.csv.dart';

/*
class _Dessert {
  _Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);

  final String name;
  final int calories;
  final double fat;
  final int carbs;
  final double protein;
  final int sodium;
  final int calcium;
  final int iron;

  bool? selected = false;
}
*/

enum ContactLabel { mobile, work }

extension ContactLabelHelper on ContactLabel {
  String get name {
    switch (this) {
      case ContactLabel.mobile:
        return "Mobile";
      case ContactLabel.work:
        return "Travail";
    }
  }
}

class Doctor {
  final String? title;
  final String name;
  final String firstName;
  final String lastName;
  final String sex;
  final String hospital;
  final String speciality;
  final String location;
  final bool isDoctor;
  final DateTime lastUpdate;
  final List<String> phoneNumbers;
  final List<String> emails;

  Doctor({
    this.title,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.sex,
    required this.hospital,
    required this.speciality,
    required this.location,
    required this.isDoctor,
    required this.lastUpdate,
    this.phoneNumbers = const <String>[],
    this.emails = const <String>[],


  });

  bool? selected = false;



  static Doctor empty = Doctor(
    name: "",
    firstName: "",
    lastName: "",
    sex: "",
    hospital: "",
    speciality: "",
    location: "",
    isDoctor: false,
    lastUpdate: DateTime.now(),
    phoneNumbers: const <String>[],
    emails: const <String>[],
  );

  /// Convenience getter to determine whether the
  /// current [Doctor] is empty.

  bool get isEmpty => this == Doctor.empty;

  /// Convenience getter to determine whether the
  /// current [Doctor] is not empty.
  bool get isNotEmpty => this != Doctor.empty;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Doctor &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          firstName == other.firstName &&
          lastName == other.lastName &&
          sex == other.sex &&
          hospital == other.hospital &&
          location == other.location &&
          isDoctor == other.isDoctor &&
          lastUpdate == other.lastUpdate &&
          phoneNumbers == other.phoneNumbers &&
          emails == other.emails);

  @override
  int get hashCode =>
      name.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      sex.hashCode ^
      hospital.hashCode ^
      location.hashCode ^
      isDoctor.hashCode ^
      lastUpdate.hashCode ^
      phoneNumbers.hashCode ^
      emails.hashCode;

  @override
  String toString() {
    return 'Doctor{'
        ' name: $name,'
        ' firstName: $firstName,'
        ' lastName: $lastName,'
        ' sex: $sex,'
        ' hospital: $hospital,'
        ' location: $location,'
        ' isDoctor: $isDoctor,'
        ' lastUpdate: $lastUpdate,'
        ' phoneNumbers: $phoneNumbers,'
        ' emails: $emails,'
        '}';
  }

  Doctor copyWith({
    String? name,
    String? firstName,
    String? lastName,
    String? sex,
    String? hospital,
    String? speciality,
    String? location,
    bool? isDoctor,
    DateTime? lastUpdate,
    List<String>? phoneNumbers,
    List<String>? emails,

  }) {
    return Doctor(
      name: name ?? this.name,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      sex: sex ?? this.sex,
      hospital: hospital ?? this.hospital,
      speciality: speciality ?? this.speciality,
      location: location ?? this.location,
      isDoctor: isDoctor ?? this.isDoctor,
      lastUpdate: lastUpdate ?? this.lastUpdate,
      phoneNumbers: phoneNumbers ?? this.phoneNumbers,
      emails: emails ?? this.emails,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'firstName': firstName,
      'lastName': lastName,
      'sex': sex,
      'hospital': hospital,
      'location': location,
      'isDoctor': isDoctor,
      'lastUpdate': lastUpdate,
      'phoneNumbers': phoneNumbers,
      'emails': emails,
      'speciality': speciality,
    };
  }

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      title: map['title'] as String,
      name: map['name'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      sex: map['sex'] as String,
      hospital: map['hospital'] as String,
      speciality: map['speciality'] as String,
      location: map['location'] as String,
      isDoctor: map['isDoctor'] as bool,
      lastUpdate: map['lastUpdate'] as DateTime,
      phoneNumbers: map['phoneNumbers'] as List<String>,
      emails: map['emails'] as List<String>,
    );
  }

  factory Doctor.fromJsonApi(Map<String, dynamic> data) {
    return Doctor(
      title: (data['title'] ?? "Unknown") as String,
      name: (data['name'] ?? "") as String,
      firstName: (data['firstName'] ?? "") as String,
      lastName: (data['lastName'] ?? "") as String,
      sex: (data['sex'] ?? "S.O") as String,
      hospital: (data['hospital'] ?? "S.O") as String,
      speciality: (data['speciality'] ?? "S.O") as String,
      location: (data['location'] ?? "") as String,
      lastUpdate: DateTime.now(),
      isDoctor: (data["is_doctor"] ?? "no").toString().toLowerCase() == 'yes',
      phoneNumbers: [
        (data['mob_number1'] ?? "") as String,
        (data['mob_number2'] ?? "") as String,
      ],
      emails: [
        (data['email1'] ?? "") as String,
        (data['email2'] ?? "") as String,
      ],
    );
  }
}

class DoctorDataSource extends DataTableSource {

  DoctorDataSource();

  List<Doctor> _doctors = doctorData
      .map((final Map<String, dynamic> data) => Doctor.fromJsonApi(data))
      .toList();

  void sort<T>(Comparable<T> Function(Doctor d) getField, bool ascending) {
    _doctors.sort((Doctor a, Doctor b) {
      if (!ascending) {
        final Doctor c = a;
        a = b;
        b = c;
      }
      final Comparable<T> aValue = getField(a);
      final Comparable<T> bValue = getField(b);
      return Comparable.compare(aValue, bValue);
    });
    notifyListeners();
  }

  int _selectedCount = 0;

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= _doctors.length) return null;
    final Doctor doctor = _doctors[index];
    return DataRow.byIndex(
      index: index,
      selected: doctor.selected!,
      onSelectChanged: (bool? value) {
        if (doctor.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          doctor.selected = value;
          notifyListeners();
        }
      },
      cells: <DataCell>[
        DataCell(
          Text("${doctor.firstName} "
              "${doctor.name} ${doctor.lastName}"),
          onDoubleTap: () {},
          onLongPress: () {},
          //showEditIcon: true,
          //placeholder: true,
        ),
        DataCell(Text(doctor.sex)),
        DataCell(Text(doctor.speciality.toString())),
        DataCell(
          Text(doctor.hospital),
          onDoubleTap: () {},
          onLongPress: () {},
        ),
        DataCell(Text(doctor.location)),
        DataCell(Text(doctor.phoneNumbers.first)),
        DataCell(
          Text(doctor.emails.first),
        ),
        DataCell(Text(doctor.isDoctor ? "Yes" : "")),
      ],
    );
  }

  @override
  int get rowCount => _doctors.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  void selectAll(bool? checked) {
    for (final Doctor doctor in _doctors) {
      doctor.selected = checked;
    }
    _selectedCount = checked! ? _doctors.length : 0;
    notifyListeners();
  }
}

class DoctorDataTablePage extends StatefulWidget {
  static route({Key? key}) =>
      MaterialPageRoute(builder: (context) => DoctorDataTablePage(key: key));

  const DoctorDataTablePage({super.key});

  //static const String routeName = '/data-table';

  @override
  State<DoctorDataTablePage> createState() => _DoctorDataTablePageState();
}

class _DoctorDataTablePageState extends State<DoctorDataTablePage> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  int? _sortColumnIndex;
  bool _sortAscending = true;
  late final DoctorDataSource _doctorsDataSource; // = DoctorDataSource();

  TransferProtocol http =
      const TransferProtocol("https://exploress.space/api/doctor-sample/csv");

  void loadData() async {
    _doctorsDataSource = DoctorDataSource();
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void _sort<T>(
      Comparable<T> Function(Doctor d) getField,
      int columnIndex,
      bool ascending,
      ) {
    _doctorsDataSource.sort<T>(getField, ascending);
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  Future<List<Map<String, dynamic>>> load() async {
    //return <Map<String, dynamic>>[];
    return http.get();
  }

  @override
  Widget build(BuildContext context) {
    /*final ScrollController scrollController = ScrollController(
      debugLabel: 'scrollDoctors',
    );*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('Données sur les docteurs'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
          future: load(), //as List<Map<String, String>>,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return SingleChildScrollView(
              //controller: scrollController,
              padding: const EdgeInsets.all(20.0),
              child: PaginatedDataTable(
                header: const Text('Docteurs'),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.link,
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        /*Go.of(context).to(
                        routeName: AddDoctorPage.routeName,
                      );*/
                      }),
                ],
                rowsPerPage: _rowsPerPage,
                onRowsPerPageChanged: (int? value) {
                  setState(() {
                    _rowsPerPage = value!;
                  });
                },
                sortColumnIndex: _sortColumnIndex,
                sortAscending: _sortAscending,
                onSelectAll: _doctorsDataSource.selectAll,
                availableRowsPerPage: const <int>[10, 20, 40],
                columns: <DataColumn>[
                  DataColumn(
                    label: const Text('Nom Complet'),
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.name, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Sex'),
                    //numeric: true,
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.sex, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Speciality'),
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.speciality, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Hospital'),
                    //tooltip: 'Each hospital.',
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.hospital, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Location'),
                    tooltip: 'Hospital location.',
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.location, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Phone'),
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.phoneNumbers.first,
                        columnIndex,
                        ascending),
                  ),
                  DataColumn(
                    label: const Text('Email'),
                    //tooltip: '',
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.emails.first, columnIndex, ascending),
                  ),
                  DataColumn(
                    label: const Text('Doctor'),
                    numeric: true,
                    onSort: (int columnIndex, bool ascending) => _sort<String>(
                        (Doctor d) => d.isDoctor.toString(),
                        columnIndex,
                        ascending),
                  ),
                ],
                source: _doctorsDataSource,
              ),
            );
          }),
    );
  }
}
