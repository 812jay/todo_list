import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// 이미지 에셋을 표시하는 공통 위젯
/// SVG와 일반 이미지 파일을 모두 지원합니다.
class AssetIcon extends StatelessWidget {
  const AssetIcon(
    this.path, {
    super.key,
    this.color,
    this.size,
    this.fit,
  });

  // 이미지 경로
  final String path;
  // 아이콘 색상 (SVG만 적용)
  final Color? color;
  // 아이콘 크기
  final double? size;
  // 이미지 맞춤 방식
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return _isPathSvg() ? _buildSvgImage() : _buildRegularImage();
  }

  /// SVG 파일인지 확인
  bool _isPathSvg() {
    return path.split('.').last == 'svg';
  }

  /// SVG 이미지 위젯 생성
  Widget _buildSvgImage() {
    return SvgPicture.asset(
      path,
      width: size,
      height: size,
      colorFilter: ColorFilter.mode(
        color ?? Colors.black,
        BlendMode.srcIn,
      ),
      fit: fit ?? BoxFit.contain,
    );
  }

  /// 일반 이미지 위젯 생성
  Widget _buildRegularImage() {
    return Image.asset(
      path,
      width: size,
      height: size,
      fit: fit ?? BoxFit.contain,
    );
  }
}
