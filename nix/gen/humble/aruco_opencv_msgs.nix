{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    aruco_opencv_msgs = substituteSource {
      src = fetchgit {
        name = "aruco_opencv_msgs-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "b472432664abda3a9f828581c914984566c8b0d0";
        hash = "sha256-Lu4v3Gqtc7DdYrxqCX/7v/jQNvn59K5SDAEiUWcUsGs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv_msgs";
  version = "2.3.1-1";
  src = sources.aruco_opencv_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
