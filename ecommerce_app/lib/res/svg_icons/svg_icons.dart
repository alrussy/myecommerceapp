

class SvgIcons{
  
  static const String base='assets/svg-icon';
  
  static const String appleIcon='$base/apple-icon.svg';
  static const String canonIcon='$base/canon-icon2.svg';
  static const String dellIcon='$base/dell-icon2.svg';
  static const String hpIcon='$base/hp-icon.svg';
  static const String huaweiIcon='$base/huawei-icon2.svg';
  static const String lenovoIcon='$base/lenovo-icon2.svg';
  static const String lgIcon='$base/lg-icon2.svg';
  static const String oppoIcon='$base/oppo-icon.svg';
  static const String samsungIcon='$base/samsung-icon2.svg';
}

List<String> laptopLogo=[
  SvgIcons.hpIcon,
  SvgIcons.dellIcon,
  SvgIcons.lenovoIcon
];
List<String> mobileLogo=[
  SvgIcons.samsungIcon,
  SvgIcons.appleIcon,
  SvgIcons.huaweiIcon,
  SvgIcons.lgIcon,
  SvgIcons.oppoIcon,
];

List<String> cameraLogo=[
  SvgIcons.canonIcon,
];

Map<String,List<String>> category={
  'laptop':laptopLogo,
  'mobile':mobileLogo,
  'camera':cameraLogo,
};