{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
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
  unique_identifier_msgs,
}:
let
  sources = rec {
    geographic_msgs = substituteSource {
      src = fetchgit {
        name = "geographic_msgs-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "caa6354cd98e112a31d8f26ab3168880bb3d327e";
        hash = "sha256-nhS4kFuDj1V2F56pjP2GmIYfCB+bVsr1RI3DzbZVfsI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geographic_msgs";
  version = "1.0.6-2";
  src = sources.geographic_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}