{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
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
    leo_msgs = substituteSource {
      src = fetchgit {
        name = "leo_msgs-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "16dd75cad32707c4e88905c5d9ab24dba51f188d";
        hash = "sha256-Jk8eBaLpozs18zESa+9yfq3J9xZliTiCKlnG4/a43Ac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_msgs";
  version = "2.0.3-1";
  src = sources.leo_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
