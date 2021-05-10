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
      imageMoscow = 'https://fs.tonkosti.ru/89/3w/893w7b7qx0wskksw0kk0k0408.jpg'),
  Sight(
      'Кремль Новгородский',
      '12345',
      'https://',
      'жилой комплекс федерального значения на берегу реки, толщина стен 6 метров',
      'музей',
      imageNovgorod = 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/VNovogorod_Detinets_VN13.jpg/1280px-VNovogorod_Detinets_VN13.jpg'),
  Sight(
      'Кремль Псковский',
      '12345',
      'https://',
      'жилой комплекс в центре Пскова один из 10 символов России',
      'музей',
      imagePskov = 'https://putidorogi-nn.ru/images/stories/evropa/pskovskiy_kreml_4.jpg')
];
