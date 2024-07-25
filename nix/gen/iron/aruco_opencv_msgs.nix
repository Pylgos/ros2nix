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
        rev = "2ef92074c96cf5b8422ec09514a55a791647dcb6";
        hash = "sha256-TA1hIkY5lQPhCXOltWymjkLFq6NU8NWQR3tdBdzifI8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv_msgs";
  version = "5.2.1-1";
  src = sources.aruco_opencv_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
