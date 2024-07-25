{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  urdf,
  xacro,
}:
let
  sources = rec {
    flir_camera_description = substituteSource {
      src = fetchgit {
        name = "flir_camera_description-source";
        url = "https://github.com/ros-drivers-gbp/flir_camera_driver-release.git";
        rev = "bee35988da7a9d8e57bf07bb36203b83ec2bed53";
        hash = "sha256-uao7PzgZPeF/X4up4zT9sFLknHa+fsn70Z5djEhYLtA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flir_camera_description";
  version = "2.1.17-1";
  src = sources.flir_camera_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher urdf xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
