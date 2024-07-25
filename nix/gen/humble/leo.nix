{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  leo_description,
  leo_msgs,
  leo_teleop,
  substituteSource,
}:
let
  sources = rec {
    leo = substituteSource {
      src = fetchgit {
        name = "leo-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "b7dffd8a57efae8e3b55976971a406c0906dea6d";
        hash = "sha256-jfG7usagmtJ003NRlsui7uU/r/1LaASGAP1m0xcok5Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo";
  version = "1.2.3-1";
  src = sources.leo;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ leo_description leo_msgs leo_teleop ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
