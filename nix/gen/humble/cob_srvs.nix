{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    cob_srvs = substituteSource {
      src = fetchgit {
        name = "cob_srvs-source";
        url = "https://github.com/4am-robotics/cob_common-release.git";
        rev = "02b406c887e817af0d57df6dc634d52ad1e29c16";
        hash = "sha256-kiRpPYJCEpnNvmO79HB5AcPt9BX4M8cASoOgUl16Elw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "cob_srvs";
  version = "2.7.10-1";
  src = sources.cob_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
