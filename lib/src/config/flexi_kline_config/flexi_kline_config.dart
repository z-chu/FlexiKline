// Copyright 2024 Andy.Zhao
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     https://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import '../../framework/export.dart';
import '../cross_config/cross_config.dart';
import '../draw_config/draw_config.dart';
import '../gesture_config/gesture_config.dart';
import '../grid_config/grid_config.dart';
import '../setting_config/setting_config.dart';

part 'flexi_kline_config.g.dart';

@FlexiConfigSerializable
class FlexiKlineConfig {
  FlexiKlineConfig({
    required this.grid,
    required this.setting,
    required this.gesture,
    required this.cross,
    required this.draw,
    required this.mainIndicator,
    this.sub = const <IIndicatorKey>{},
  });

  GridConfig grid;
  SettingConfig setting;
  GestureConfig gesture;
  CrossConfig cross;
  DrawConfig draw;
  MainPaintObjectIndicator mainIndicator;
  Set<IIndicatorKey> sub;

  factory FlexiKlineConfig.fromJson(Map<String, dynamic> json) =>
      _$FlexiKlineConfigFromJson(json);

  Map<String, dynamic> toJson() {
    return _$FlexiKlineConfigToJson(this);
  }
}
