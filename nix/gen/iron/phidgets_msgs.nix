{
  ament_cmake,
  buildRosPackage,
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
    phidgets_msgs = substituteSource {
      src = fetchgit {
        name = "phidgets_msgs-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "27a60e0c0ec46a7ebd8e11c8f7d22edcb3d6aed9";
        hash = "sha256-IenMv0kesMXll/udluqu/FKfShQu8sd0QaGFr+rW4/E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_msgs";
  version = "2.3.3-1";
  src = sources.phidgets_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
