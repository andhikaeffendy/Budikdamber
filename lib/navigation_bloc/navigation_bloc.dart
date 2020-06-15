import 'package:budikdamber/Dashboard.dart';
import 'package:budikdamber/Statistik.dart';
import 'package:budikdamber/faq.dart';
import 'package:budikdamber/profile.dart';
import 'package:budikdamber/emberku.dart';
import 'package:budikdamber/settings.dart';
import 'package:budikdamber/tutorial.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum NavigationEvents {
  BerandaClickEvent,
  ProfileClickEvent,
  EmberkuClickEvent,
  TutorialClickEvent,
  StatistikClickEvent,
  SettingsClickEvent,
  FAQClickEvent
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  @override
  NavigationStates get initialState => Dashboard();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
    switch(event){
      case NavigationEvents.BerandaClickEvent: yield Dashboard();
      break;
      case NavigationEvents.EmberkuClickEvent: yield Emberku();
      break;
      case NavigationEvents.ProfileClickEvent: yield Profile();
      break;
      case NavigationEvents.TutorialClickEvent: yield Tutorial();
      break;
      case NavigationEvents.StatistikClickEvent: yield Statistik();
      break;
      case NavigationEvents.SettingsClickEvent: yield Settings();
      break;
      case NavigationEvents.FAQClickEvent: yield FAQ();
      break;
    }
  }

}