{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    dolly_follow = substituteSource {
      src = fetchgit {
        name = "dolly_follow-source";
        url = "https://github.com/ros2-gbp/dolly-release.git";
        rev = "3f126b91fb71acee9c8823e3b5f41dbb228f16e0";
        hash = "sha256-Udj2U+dWE5+JIz9GOSB6X4C9y3g/g30Jp3+BTuiiRX0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "dolly_follow";
  version = "0.4.0-5";
  src = sources.dolly_follow;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
