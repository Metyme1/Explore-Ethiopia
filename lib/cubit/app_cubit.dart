// import 'package:bloc/bloc.dart';
// import 'package:ethiopia/cubit/app_cubit_state.dart';
// import 'package:ethiopia/pages/explore.dart';
// import 'package:ethiopia/services/data_services..dart';
//
// import '../model/data_model.dart';
//
// class AppCubits extends Cubit<CubitStates>{
//   AppCubits({required this.data}) : super(InitialState()){
//     emit(WelcomeState());
//   }
//   final DataServices data;
//   late final places;
//   void getData(){
//     try{
//       emit(LoadedState());
//       places=data.getInfo();
//       emit(LoadedState(places));
//     }catch(e){
//
//     }
//   }
//   detailPage(DataModel data){
//     emit(DetailState(data));
//   }
//   goHome(){
//     emit(LoadedState(places));
//   }
// }
