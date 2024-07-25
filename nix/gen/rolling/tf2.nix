{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_google_benchmark,
  ament_cmake_gtest,
  ament_cmake_lint_cmake,
  ament_cmake_ros,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rcutils,
  rosidl_runtime_cpp,
  substituteSource,
}:
let
  sources = rec {
    tf2 = substituteSource {
      src = fetchgit {
        name = "tf2-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "7fb8b3b3ebbb7fcc556df741f81e86f7c2214c29";
        hash = "sha256-yhBfHKhhIKRn4m2jNHV6S4M4vP8LND+23trE6XwTf3w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2";
  version = "0.38.0-1";
  src = sources.tf2;
  nativeBuildInputs = [ ament_cmake ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rcutils rosidl_runtime_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
