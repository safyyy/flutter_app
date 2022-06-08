import 'package:citoyen/espace%20admin/Dash/HeaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AdminDsh extends StatefulWidget {
  
  const AdminDsh({ Key? key }) : super(key: key);

  @override
  State<AdminDsh> createState() => _AdminDshState();
}

class _AdminDshState extends State<AdminDsh> {
   late List<AGData> _chartData;
      late List<GData> _genderData;

   late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _chartData = getChartData();
        _genderData = getGenderData();

    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

return Container (
    margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18.0),
        ),
        
        

  child: Scaffold(  
      body:Column(
        
        
        children: [
          Flexible(
              child:HeaderWidget(),
              flex: 0,
            ),
          SfCircularChart(
            
            
             palette: <Color>[Colors.orangeAccent, Colors.brown, Colors.green,],
            title: ChartTitle(text: 'Age group'),
            legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap,backgroundColor:Color.fromARGB(0, 143, 212, 122)),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
            PieSeries<AGData,String>(
              
              dataSource: _chartData,
              xValueMapper: (AGData data,_)=> data.continent, 
              yValueMapper: (AGData data,_)=>data.age,
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
             
            ),
            
          ],),
          
          Flexible(

            child: SfCircularChart(
              
               palette: const <Color>[Color.fromARGB(255, 255, 64, 182), Color.fromARGB(255, 124, 204, 247),],
                           title: ChartTitle(text: 'Gender group'),

              legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap,backgroundColor:Color.fromARGB(0, 143, 212, 122)),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
              PieSeries<GData,String>(
                
                dataSource: _genderData ,
                xValueMapper: (GData data,_)=> data.continent, 
                yValueMapper: (GData data,_)=>data.gender,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
               
              ),
              
            ],
            ),
          ),
          
        ],
        
         
      ),
      
      
      ),
      );
  }
    List<AGData> getChartData(){
  final List<AGData> chartData = [
    AGData('Youth',600,),
    AGData('old',350),
     AGData('Elderly',100),

  ];
  return chartData;
}
 List<GData> getGenderData(){
  final List<GData> genderData = [
    GData('Female',600),
    GData('Male',350),

  ];
  return genderData;
}

}
class AGData{
  AGData(this.continent,this.age);
final String continent;
final int age;
}

class GData{
  GData(this.continent,this.gender);
final String continent;
final int gender;
}



     


