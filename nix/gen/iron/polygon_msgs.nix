{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    polygon_msgs = substituteSource {
      src = fetchgit {
        name = "polygon_msgs-source";
        url = "https://github.com/ros2-gbp/polygon_ros-release.git";
        rev = "91e98585dd02a972f097e68c53a932e471d76a54";
        hash = "sha256-6gLLltnSdYNP7QkYUOAj9bdphjw1W6jDytYsbJL7DA4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "polygon_msgs";
  version = "1.0.2-2";
  src = sources.polygon_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
