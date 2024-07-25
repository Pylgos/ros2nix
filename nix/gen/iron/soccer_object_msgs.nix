{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    soccer_object_msgs = substituteSource {
      src = fetchgit {
        name = "soccer_object_msgs-source";
        url = "https://github.com/ros2-gbp/soccer_object_msgs-release.git";
        rev = "0507bc7a6c3d8727cd1e35bb01d45cd06143921a";
        hash = "sha256-osJgWvej6UcU+BYi2uVgk/0T+Llr1DrpMYyN7Ct91oc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_object_msgs";
  version = "1.1.0-3";
  src = sources.soccer_object_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
