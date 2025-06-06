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

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter/painting.dart';

import '../../constant.dart';
import '../../framework/serializers.dart';
import '../line_config/line_config.dart';
import '../text_area_config/text_area_config.dart';

part 'mark_config.g.dart';

@CopyWith()
// 标记(最高价/最低价/最新价)
@FlexiConfigSerializable
class MarkConfig {
  const MarkConfig({
    this.show = true,
    this.spacing = 0,
    this.line = const LineConfig(),
    this.text = const TextAreaConfig(
      style: TextStyle(
        fontSize: defaulTextSize,
        overflow: TextOverflow.ellipsis,
        height: defaultTextHeight,
      ),
    ),
    this.hitTestMargin = 0,
  });

  final bool show;
  // 间距.
  // 1. 在Candle图中high和low价钱标记中, 指line和text之间的间距.
  // 2. 在Candle图中latest和countDown标记中, 指与其屏幕边界之间的间距.
  // 3. 在Candle图中last(最后价)配置中, 指与latest左边界之间的间距.
  final double spacing;
  final LineConfig line;
  final TextAreaConfig text;

  /// 用于扩大点击测试的区域, 如[MarkConfig]无需点击事件, 不用配置.
  final double hitTestMargin;

  double get lineLength => line.length ?? 0;

  MarkConfig of({
    Color? paintColor,
    Color? textColor,
    Color? background,
    Color? borderColor,
  }) {
    return copyWith(
      line: line.of(paintColor: paintColor),
      text: text.of(
        textColor: textColor,
        background: background,
        borderColor: borderColor,
      ),
    );
  }

  factory MarkConfig.fromJson(Map<String, dynamic> json) =>
      _$MarkConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MarkConfigToJson(this);
}
