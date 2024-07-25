{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    wireless_msgs = substituteSource {
      src = fetchgit {
        name = "wireless_msgs-source";
        url = "https://github.com/clearpath-gbp/wireless-release.git";
        rev = "f722f3cf5728200ced2ca095de2c70cbf3593fe0";
        hash = "sha256-vj2NOLa9VWJ1SiFTDl0khfT/IRktOXwKn+axT/8zUSI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "wireless_msgs";
  version = "1.1.0-1";
  src = sources.wireless_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
