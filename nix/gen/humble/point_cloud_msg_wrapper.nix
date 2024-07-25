{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    point_cloud_msg_wrapper = substituteSource {
      src = fetchgit {
        name = "point_cloud_msg_wrapper-source";
        url = "https://github.com/ros2-gbp/point_cloud_msg_wrapper-release.git";
        rev = "eea3733e4c4aaab42d6e6e6f8b721b00088d0d48";
        hash = "sha256-LiHXg+Jj7fMDItxqFAz8F5On1mitqVf18p4luIzXtWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "point_cloud_msg_wrapper";
  version = "1.0.7-3";
  src = sources.point_cloud_msg_wrapper;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
