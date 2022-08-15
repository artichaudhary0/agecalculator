import 'package:age_calculator/age_calculator.dart';

class AgeCalculation {
  //calculate age of person
  calculateAge(DateTime today, DateTime birthday) {
    DateDuration age;
    age = AgeCalculator.dateDifference(
      fromDate: birthday,
      toDate: today,
    );
    return age;
  }

//calculate next birthday time left
  nextBirthDay(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, today.month, today.day, today.weekday);
    DateTime nextBirthdayDate = temp.isBefore(today)
        ? AgeCalculator.add(date: today, duration: DateDuration(years: 1))
        : temp;

    DateDuration nextBirthday;
    nextBirthday = AgeCalculator.timeToNextBirthday(today, fromDate: birthday);
    return nextBirthday;
  }

//calculate next birthd Weekday(mon....)
  weekDay(DateTime today, DateTime birthday) {
    DateTime temp = DateTime(today.year, today.month, today.day, today.weekday);
    DateTime nextBirthdayDate = temp.isBefore(today)
        ? AgeCalculator.add(date: today, duration: DateDuration(years: 1))
        : temp;
    return nextBirthdayDate.weekday;
  }
}

 
