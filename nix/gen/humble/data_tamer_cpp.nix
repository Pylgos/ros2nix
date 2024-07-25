{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  data_tamer_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mcap_vendor,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    data_tamer_cpp = substituteSource {
      src = fetchgit {
        name = "data_tamer_cpp-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "cf1563eb8bbe000145137ad86fdca1fa47635da0";
        hash = "sha256-JKRlUHutk0nQ6UxEWVklJII/g5giySpZUMfAET8HP+0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "data_tamer_cpp";
  version = "0.9.3-2";
  src = sources.data_tamer_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ data_tamer_msgs mcap_vendor rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
