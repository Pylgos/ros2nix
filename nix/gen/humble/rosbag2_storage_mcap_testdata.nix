{
  action_msgs,
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  substituteSource,
}:
let
  sources = rec {
    rosbag2_storage_mcap_testdata = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_mcap_testdata-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "917036b69d1e7f45762920422fb6334b82667e63";
        hash = "sha256-JdJN86rSU/B45reGxRLmaNVWhsN4bxph1iP/Oq8wcxg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_storage_mcap_testdata";
  version = "0.15.11-1";
  src = sources.rosbag2_storage_mcap_testdata;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
