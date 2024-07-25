{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rcutils,
  rosidl_typesupport_interface,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_c = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_c-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "5d2c8608f9c8b4a811c2e501ad5b37dc4191742e";
        hash = "sha256-P6cPtq8U0dkEyIHUJs+um9uQglB+pz+HNU4YLPF9o0o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_c";
  version = "4.0.1-1";
  src = sources.rosidl_runtime_c;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils rosidl_typesupport_interface ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
