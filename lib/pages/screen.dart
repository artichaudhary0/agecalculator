import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/material.dart';

import '../service/agecalculation.dart';
import 'dayhourminvaluecard.dart';
import 'yearmonthweekvaluecard.dart';

class ScreenView extends StatefulWidget {
  const ScreenView({Key? key}) : super(key: key);

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  DateTime todayDate = DateTime.now();
  DateTime dob = DateTime(2000, 1, 1);
  late DateDuration _dateDuration;
  late DateDuration _durationNextBirthday;
  late int _weekDay;

  // ignore: prefer_final_fields
  List<String> _months = [
    "months",
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  // ignore: prefer_final_fields
  List<String> _days = [
    "DAYS",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY",
    "SUNDAY",
  ];

  Future<void> selectTodayDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: todayDate,
      firstDate: dob,
      lastDate: DateTime(2101),
    );

    if ((picked != null) && (picked != todayDate)) {
      setState(() {
        todayDate = picked;
        _dateDuration = AgeCalculation().calculateAge(todayDate, dob);
        _durationNextBirthday = AgeCalculation().nextBirthDay(dob, todayDate);
        _weekDay = AgeCalculation().weekDay(todayDate, dob);
      });
    }
  }

  Future<void> selectdob(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dob,
        firstDate: DateTime(1900),
        lastDate: todayDate);
    if (picked != null && picked != todayDate) {
      setState(() {
        dob = picked;
        _dateDuration = AgeCalculation().calculateAge(todayDate, dob);
        _durationNextBirthday = AgeCalculation().nextBirthDay(dob, todayDate);
        _weekDay = AgeCalculation().weekDay(todayDate, dob);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dateDuration = AgeCalculation().calculateAge(todayDate, dob);
    _durationNextBirthday = AgeCalculation().nextBirthDay(dob, todayDate);
    _weekDay = AgeCalculation().weekDay(todayDate, dob);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(children: [
        const SizedBox(
          height: 30.0,
          width: double.maxFinite,
        ),
        const Text(
          "AGE CALCULATOR",
          style: TextStyle(
              fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "TODAY",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${todayDate.day} ${_months[todayDate.month]} ${todayDate.year}",
                    style: const TextStyle(
                        color: Color(0xffCDDC39),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () => selectTodayDate(context),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Date of Birth",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${dob.day} ${_months[dob.month]} ${dob.year}",
                    style: const TextStyle(
                        color: Color(0xffCDDC39),
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: (() => selectdob(context)),
                    child: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              15,
            ),
            color: const Color(0xff333333),
          ),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "AGE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${_dateDuration.years}",
                              style: const TextStyle(
                                  color: Color(0xffCDDC39),
                                  fontSize: 76,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 13),
                              child: Text(
                                "YEARS",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                        Text(
                          "${_dateDuration.months} months | ${_dateDuration.days} days",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                ),
                Container(
                  height: 170,
                  width: 1,
                  color: const Color(0xff999999),
                ),
                Container(
                  height: 200,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "NEXT BIRTHDAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Icon(
                          Icons.cake,
                          color: Color(
                            0xffCDDC39,
                          ),
                          size: 40,
                        ),
                        Text(
                          "${_days[_weekDay]} ",
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "${_durationNextBirthday.months} months | ${_durationNextBirthday.days} days",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ]),
                )
              ],
            ),
            Container(
              height: 1,
              width: double.maxFinite,
              color: const Color(0xff999999),
              margin: const EdgeInsets.symmetric(horizontal: 15),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "SUMMARY",
                style: TextStyle(
                    color: Color(0xffCDDc39),
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  summaryValueSecond(
                    textValue: "YEARS",
                    value: "${_dateDuration.years}",
                  ),
                  summaryValueSecond(
                    textValue: "MONTHS",
                    value:
                        "${((_dateDuration.years) * 12) + _dateDuration.months}",
                  ),
                  summaryValueSecond(
                    textValue: "WEEKS",
                    value: "${(todayDate.difference(dob).inDays / 7).floor()}",
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  summaryValues(
                    textValue: "DAYS",
                    value: "${todayDate.difference(dob).inDays}",
                  ),
                  summaryValues(
                    textValue: "HOURS",
                    value: "${todayDate.difference(dob).inHours}",
                  ),
                  summaryValues(
                    textValue: "MINUTES",
                    value: "${todayDate.difference(dob).inMinutes}",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ]),
        )
      ]),
    );
  }
}
