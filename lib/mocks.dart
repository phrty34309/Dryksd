import 'package:places/domain/sight.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/screen/AddSightScreen.dart';

var imageMoscow;
var imageNovgorod;
var imagePskov;
var image;
// Широта: 55.7546469, Долгота: 37.6214679

List mocks = [
  Sight(
      'Московский кремль',
      [55.75216819057104, 37.61747794026299],
      'https://',
      'музей с часами и укреплённыи стенами',
      'музей',
      imageMoscow =
          'https://fs.tonkosti.ru/89/3w/893w7b7qx0wskksw0kk0k0408.jpg'),
  Sight(
      'Кремль Новгородский',
      [58.52154673592064, 31.274997011557634],
      'https://',
      'жилой комплекс федерального значения на берегу реки, толщина стен 6 метров',
      'музей',
      imageNovgorod =
          'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/VNovogorod_Detinets_VN13.jpg/1280px-VNovogorod_Detinets_VN13.jpg'),
  Sight(
      'Кремль Псковский',
      [57.82216459955697, 28.32893312210416],
      'https://',
      'жилой комплекс в центре Пскова один из 10 символов России',
      'музей',
      imagePskov =
          'https://putidorogi-nn.ru/images/stories/evropa/pskovskiy_kreml_4.jpg'),
];
