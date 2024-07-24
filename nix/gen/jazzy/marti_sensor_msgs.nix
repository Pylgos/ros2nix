{
  ament_cmake,
  buildRosPackage,
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
    marti_sensor_msgs = substituteSource {
      src = fetchgit {
        name = "marti_sensor_msgs-source";
        url = "https://github.com/ros2-gbp/marti_messages-release.git";
        rev = "78ca6c513f16161e13428e3986735e4bfae35d8e";
        hash = "sha256-WyVlezrzQz/gG2DAcv31gIGeJ5Y6ex4TFTymyh4DDY8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "marti_sensor_msgs";
  version = "1.5.2-3";
  src = sources.marti_sensor_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
