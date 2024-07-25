{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cyclonedds,
  fetchgit,
  fetchurl,
  fetchzip,
  iceoryx_binding_c,
  rcpputils,
  rcutils,
  rmw,
  rmw_dds_common,
  rosidl_runtime_c,
  rosidl_typesupport_introspection_c,
  rosidl_typesupport_introspection_cpp,
  substituteSource,
  tracetools,
}:
let
  sources = rec {
    rmw_cyclonedds_cpp = substituteSource {
      src = fetchgit {
        name = "rmw_cyclonedds_cpp-source";
        url = "https://github.com/ros2-gbp/rmw_cyclonedds-release.git";
        rev = "beb0ca9d9b6e195801e6eafd9025c0fe89337e44";
        hash = "sha256-YmAUomFUBIQyg6htBkT6gJiF3m65hoEzp/IO/1iFKts=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_cyclonedds_cpp";
  version = "1.3.4-1";
  src = sources.rmw_cyclonedds_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cyclonedds iceoryx_binding_c rcpputils rcutils rmw_dds_common rosidl_runtime_c rosidl_typesupport_introspection_c rosidl_typesupport_introspection_cpp tracetools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
