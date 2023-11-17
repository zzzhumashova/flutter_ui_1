import 'package:bloc/bloc.dart';
import 'package:travel_app_ui/cubit/app_cubit_states.dart';
import 'package:travel_app_ui/model/data_model.dart';
import 'package:travel_app_ui/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final places;

  void getData()async{
    try{
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    }catch(e){
      emit(ErrorState(e.toString()));
    }
  }

  detailPage(DataModel data){
    emit(DetailState(data));
  }

  goHome(){
    emit(LoadedState(places));
  }

}