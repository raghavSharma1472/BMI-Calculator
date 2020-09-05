import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.weight,this.height});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String calculateResults() {
    if(_bmi>=30){
      return 'OBESE';
    }else if(_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>=18.2){
      return 'NORMAL';
    }else if(_bmi>=10){
      return 'UNDERWEIGHT';
    }else{
      return 'MALNOURISHED';
    }
  }

  String getInterpretation(){
    if(_bmi>=25){
      return 'You have to reduce your weight. Do Excercise!';
    }else if(_bmi>=18.2){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have to increase you weight. Eat more!';
    }
  }
}