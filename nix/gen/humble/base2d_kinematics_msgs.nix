{
  ament_cmake,
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
    base2d_kinematics_msgs = substituteSource {
      src = fetchgit {
        name = "base2d_kinematics_msgs-source";
        url = "https://github.com/ros2-gbp/metro_nav-release.git";
        rev = "bd769df3b94e921f84aeba82cc2d1c6505c5c253";
        hash = "sha256-3sJLR0lx+7jybIEgFf7IzDI5DVJygb9TDuzGED8nzas=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "base2d_kinematics_msgs";
  version = "0.2.0-1";
  src = sources.base2d_kinematics_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
