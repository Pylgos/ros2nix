{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    rosidl_typesupport_interface = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_interface-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "4fda61d5b4c85c7c2520f92778ce1d08d583e946";
        hash = "sha256-6c3Q4mxV/3vKhvoqwbtgS6a3sxqGuSb3QBmHqm2nBhc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_typesupport_interface";
  version = "4.0.1-1";
  src = sources.rosidl_typesupport_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
