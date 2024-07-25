{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_gz_bridge,
  ros_gz_image,
  ros_gz_sim,
  ros_gz_sim_demos,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    ros_gz = substituteSource {
      src = fetchgit {
        name = "ros_gz-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "61fef49be936923f5e13bc9fd7f061c3c58403b2";
        hash = "sha256-L3LuGUunlPRFnCKN3MIk9bA6rt7YCcJs8WWGmTWQu+I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz";
  version = "0.254.1-1";
  src = sources.ros_gz;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros_gz_bridge ros_gz_image ros_gz_sim ros_gz_sim_demos ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
