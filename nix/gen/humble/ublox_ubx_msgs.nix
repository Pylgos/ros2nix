{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ublox_ubx_msgs = substituteSource {
      src = fetchgit {
        name = "ublox_ubx_msgs-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "2a057199af6aff380fd2fcabb1aa658905c49322";
        hash = "sha256-d1eQuxQmQ4HUaJpQrGaNr65zDU5ZB4d0liyHXxaS3Qw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ublox_ubx_msgs";
  version = "0.5.2-1";
  src = sources.ublox_ubx_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
