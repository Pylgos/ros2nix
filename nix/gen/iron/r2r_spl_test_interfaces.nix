{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl_test_interfaces = substituteSource {
      src = fetchgit {
        name = "r2r_spl_test_interfaces-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "20af05c7e8d7ebadb3cef8e7c69ba1e330a48acf";
        hash = "sha256-YjUMG5ZdNybrZieq7hKal9YJx/sn0TtrABu0qtcC2VU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_test_interfaces";
  version = "3.1.0-1";
  src = sources.r2r_spl_test_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
