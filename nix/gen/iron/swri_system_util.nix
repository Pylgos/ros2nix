{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    swri_system_util = substituteSource {
      src = fetchgit {
        name = "swri_system_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "e481d7ea8aba516f37f740e8d38abe9e649286ee";
        hash = "sha256-S3WYBS3mwgU0LQXSc43+46DAtHiOBbXgwl4IfjI5Fuo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "swri_system_util";
  version = "3.6.1-1";
  src = sources.swri_system_util;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
