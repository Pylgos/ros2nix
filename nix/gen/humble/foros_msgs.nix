{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    foros_msgs = substituteSource {
      src = fetchgit {
        name = "foros_msgs-source";
        url = "https://github.com/ros2-gbp/foros-release.git";
        rev = "a2621dabcd63ebb67347338b2a126b0694d198c1";
        hash = "sha256-2BfM+m3iK91wzWpNIBa4jXvgTI/2J8uCslc7wc8omzs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foros_msgs";
  version = "0.4.1-2";
  src = sources.foros_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
