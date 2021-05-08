import 'package:places/domain/sight.dart';
import 'package:flutter/material.dart';

var imageMoscow;
var imageNovgorod;
var imagePskov;

final List mocks = [
  Sight(
      'Кремль Московский',
      '12345',
      'https://',
      'музей с часами и укреплённыи стенами',
      'музей',
      imageMoscow = 'assets/image/кремль_Москва.jpg'),
  Sight(
      'Кремль Новгородский',
      '12345',
      'https://',
      'жилой комплекс федерального значения на берегу реки, толщина стен 6 метров',
      'музей',
      imageNovgorod = 'assets/image/кремль_Новгород.jpg'),
  Sight(
      'Кремль Псковский',
      '12345',
      'https://',
      'жилой комплекс в центре Пскова один из 10 символов России',
      'музей',
      imagePskov = 'assets/image/кремль_Псков.jpg')
];
