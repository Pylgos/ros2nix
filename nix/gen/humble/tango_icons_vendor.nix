{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  tango-icon-theme,
}:
let
  sources = rec {
    tango_icons_vendor = substituteSource {
      src = fetchgit {
        name = "tango_icons_vendor-source";
        url = "https://github.com/ros2-gbp/tango_icons_vendor-release.git";
        rev = "a391cbcb71fcf8f5811d814e8f87c947f2fb1e8e";
        hash = "sha256-W3FsRXSDdse1uyGMIWSNAcAyiWYLQ6heM2+2/WTta4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tango_icons_vendor";
  version = "0.1.1-3";
  src = sources.tango_icons_vendor;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ tango-icon-theme ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
